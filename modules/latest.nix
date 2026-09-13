# Manual installer command for the bleeding-edge Claude Code build at
# ~/.local/bin/claude. Coexists with whatever Claude Code binary is
# installed via the standard package (nix, brew, etc.).
#
# Exposes `claude-latest-install` on PATH. Run it once to bootstrap;
# Claude Code's own `claude update` keeps the binary current after that.
#
# Web docs: https://claude.ai/install.sh
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.claude.latest;

  installScript = pkgs.writeShellApplication {
    name = "claude-latest-install";
    runtimeInputs = [
      pkgs.curl
      pkgs.coreutils
    ];
    text = builtins.readFile ./scripts/claude-latest-install.sh;
  };
in
{
  options.programs.claude.latest = {
    enable = lib.mkEnableOption ''
      the `claude-latest-install` command for bootstrapping the
      bleeding-edge Claude Code build outside of nixpkgs' release cycle.
      Run the command manually once; Claude Code self-updates thereafter
      via `claude update`.
    '';

    installOnActivation = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Run `claude-latest-install` during home-manager activation, so every
        user profile that enables it gets the binary without a manual step.
        The installer is a no-op once installed. Requires network access on
        first activation.
      '';
    };
  };

  config = lib.mkIf (config.programs.claude.enable && cfg.enable && pkgs.stdenv.isDarwin) {
    home.packages = [ installScript ];

    home.activation = lib.mkIf cfg.installOnActivation {
      claudeLatestInstall = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        $DRY_RUN_CMD ${installScript}/bin/claude-latest-install
      '';
    };
  };
}
