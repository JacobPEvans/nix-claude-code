# Home-manager activation checks for nix-claude-code.
# Extracted from flake/checks.nix to stay under the 12KB per-file size gate.
{
  inputs,
  self,
  pkgs,
  ...
}:
let
  mkActivation =
    extraModule:
    (inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        self.homeModules.default
        {
          home = {
            username = "ci-tester";
            homeDirectory = "/tmp/ci-tester-home";
            stateVersion = "25.11";
          };
        }
        extraModule
      ];
    }).activationPackage;

  mkStatuslineCheck =
    theme:
    mkActivation {
      programs.claude = {
        enable = true;
        package = null;
        statusline = {
          enable = true;
          inherit theme;
        };
      };
    };

  programsClaudeEval = mkActivation {
    programs.claude = {
      enable = true;
      package = null;
    };
  };

  hooksRegistrationActivation = mkActivation {
    programs.claude = {
      enable = true;
      package = null;
      hooks.refreshMarketplaces = true;
    };
  };

  # `latest.installOnActivation` is gated on pkgs.stdenv.isDarwin same as
  # `latest.enable` itself — on x86_64-linux CI the module stays inert
  # either way, so only the darwin leg of this check actually exercises the
  # activation entry; the linux leg proves it stays absent by default.
  latestInstallOnActivationTrue = mkActivation {
    programs.claude = {
      enable = true;
      package = null;
      latest = {
        enable = true;
        installOnActivation = true;
      };
    };
  };

  latestInstallOnActivationFalse = mkActivation {
    programs.claude = {
      enable = true;
      package = null;
      latest.enable = true;
    };
  };

  outputStyleActivation = mkActivation {
    programs.claude = {
      enable = true;
      package = null;
      outputStyle = "concise";
    };
  };
  # Exercises the sandbox sub-keys and one policy key. Before the renderer
  # emitted the whole attrset, everything except enabled /
  # autoAllowBashIfSandboxed / excludedCommands was dropped, so this fixture
  # fails against the old behaviour.
  sandboxPolicyActivation = mkActivation {
    programs.claude = {
      enable = true;
      package = null;
      settings = {
        sandbox = {
          enabled = true;
          network = {
            allowUnixSockets = [ "/tmp/example.sock" ];
          };
          filesystem = {
            allowWritePaths = [ "/tmp/example" ];
          };
          failIfUnavailable = true;
        };
        disableSkillShellExecution = true;
        minimumVersion = "2.1.251";
      };
    };
  };

  claudeSwapDefaultDisabled =
    (inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        self.homeModules.default
        {
          home = {
            username = "ci-tester";
            homeDirectory = "/tmp/ci-tester-home";
            stateVersion = "25.11";
          };
        }
      ];
    }).config.programs.claude.swap.disabled;

  claudeSwapPackage = import ../../packages/claude-swap.nix {
    inherit pkgs;
    src = inputs.claude-swap;
  };
in
{
  programs-claude-eval = programsClaudeEval;

  statusline-powerline = mkStatuslineCheck "powerline";
  statusline-ccstatusline = mkStatuslineCheck "ccstatusline";
  statusline-daniel3303 = mkStatuslineCheck "daniel3303";

  claude-settings-render =
    pkgs.runCommand "claude-settings-render-test" { nativeBuildInputs = [ pkgs.jq ]; }
      ''
        set -euo pipefail
        settings_json=$(grep -o '/nix/store/[a-z0-9]*-claude-settings\.json' \
          ${programsClaudeEval}/activate | head -1)

        expect() {
          local filter="$1" want="$2" got
          got=$(jq -c "$filter" "$settings_json")
          [[ "$got" == "$want" ]] || {
            echo "$filter: expected $want, got $got" >&2
            exit 1
          }
        }

        expect '.permissions.allow' '[]'
        expect '.permissions.ask' '[]'
        expect '.permissions.deny' '[]'
        expect '.permissions.defaultMode' '"auto"'
        expect '.autoMode.classifyAllShell' 'true'
        expect '.askUserQuestionTimeout' '"5m"'
        expect '.useAutoModeDuringPlan' 'true'
        expect 'has("advisorModel")' 'false'
        expect 'has("outputStyle")' 'false'
        echo ok > $out
      '';

  # Regression: every sandbox sub-key a caller sets must reach settings.json.
  # `sandbox` is in settings.nix's `knownSettingsKeys`, so it is excluded from
  # the freeform passthrough — when the renderer named sub-keys individually,
  # anything else was silently discarded.
  sandbox-policy-render =
    pkgs.runCommand "sandbox-policy-render-test" { nativeBuildInputs = [ pkgs.jq ]; }
      ''
        set -euo pipefail
        settings_json=$(grep -o '/nix/store/[a-z0-9]*-claude-settings\.json' \
          ${sandboxPolicyActivation}/activate | head -1)

        expect() {
          local filter="$1" want="$2" got
          got=$(jq -c "$filter" "$settings_json")
          [[ "$got" == "$want" ]] || {
            echo "$filter: expected $want, got $got" >&2
            exit 1
          }
        }

        # The three that always worked.
        expect '.sandbox.enabled' 'true'
        expect '.sandbox.autoAllowBashIfSandboxed' 'true'
        # The ones that used to be dropped.
        expect '.sandbox.failIfUnavailable' 'true'
        expect '.sandbox.network.allowUnixSockets' '["/tmp/example.sock"]'
        expect '.sandbox.filesystem.allowWritePaths' '["/tmp/example"]'
        # Unset sub-keys stay absent rather than emitting an explicit null.
        expect '.sandbox | has("ignoreViolations")' 'false'
        expect '.sandbox | has("excludedCommands")' 'false'
        # Policy keys render at the top level.
        expect '.disableSkillShellExecution' 'true'
        expect '.minimumVersion' '"2.1.251"'
        echo ok > $out
      '';

  # `latest.installOnActivation` must register the activation entry only
  # when set, and only on darwin (the module's own gate).
  latest-install-on-activation = pkgs.runCommand "latest-install-on-activation-test" { } ''
    set -euo pipefail
    grep -q "claude-latest-install" ${latestInstallOnActivationFalse}/activate && exit 1
    test ${if pkgs.stdenv.isDarwin then "1" else "0"} -eq 0 || \
      grep -q "claude-latest-install" ${latestInstallOnActivationTrue}/activate
    echo ok > $out
  '';

  # Every new policy/sandbox option defaults to null, so a consumer that sets
  # none of them gets a settings.json with none of them present. This is the
  # "stays absent unless a consumer sets it" class this repo owns.
  policy-options-default-absent =
    pkgs.runCommand "policy-options-default-absent-test" { nativeBuildInputs = [ pkgs.jq ]; }
      ''
        set -euo pipefail
        settings_json=$(grep -o '/nix/store/[a-z0-9]*-claude-settings\.json' \
          ${programsClaudeEval}/activate | head -1)

        for key in disableAllHooks allowedHttpHookUrls httpHookAllowedEnvVars \
                   disableSkillShellExecution disableBundledSkills claudeMdExcludes \
                   enabledMcpjsonServers disabledMcpjsonServers allowedMcpServers \
                   deniedMcpServers disableRemoteControl minimumVersion; do
          got=$(jq -c --arg k "$key" 'has($k)' "$settings_json")
          [[ "$got" == "false" ]] || {
            echo "$key: expected absent by default, got present" >&2
            exit 1
          }
        done

        # sandbox is gated on enabled=false by default, so the whole key is absent.
        got=$(jq -c 'has("sandbox")' "$settings_json")
        [[ "$got" == "false" ]] || {
          echo "sandbox: expected absent when disabled, got present" >&2
          exit 1
        }
        echo ok > $out
      '';

  output-style-render =
    pkgs.runCommand "output-style-render-test" { nativeBuildInputs = [ pkgs.jq ]; }
      ''
        set -euo pipefail
        settings_json=$(grep -o '/nix/store/[a-z0-9]*-claude-settings\.json' \
          ${outputStyleActivation}/activate | head -1)
        got=$(jq -r '.outputStyle // empty' "$settings_json")
        [[ "$got" == "concise" ]] || {
          echo "expected outputStyle to be concise, got: $got" >&2
          exit 1
        }
        echo ok > $out
      '';

  hooks-registration =
    pkgs.runCommand "hooks-registration-test" { nativeBuildInputs = [ pkgs.jq ]; }
      ''
        set -euo pipefail
        settings_json=$(grep -o '/nix/store/[a-z0-9]*-claude-settings\.json' \
          ${hooksRegistrationActivation}/activate | head -1)
        command=$(jq -r '.hooks.SessionStart[0].hooks[0].command' "$settings_json")
        [[ "$command" == *".claude/hooks/session-start.sh" ]] || {
          echo "expected hooks.SessionStart to register session-start.sh, got: $command" >&2
          exit 1
        }
        echo ok > $out
      '';

  claude-swap-default-disabled =
    assert claudeSwapDefaultDisabled;
    pkgs.runCommand "claude-swap-default-disabled-test" { } ''
      echo ok > $out
    '';

  claude-swap-package = pkgs.runCommand "claude-swap-package-test" { } ''
    test -x ${claudeSwapPackage}/bin/cswap
    test -x ${claudeSwapPackage}/bin/claude-swap
    ${claudeSwapPackage}/bin/cswap --help > /dev/null
    echo ok > $out
  '';
}
