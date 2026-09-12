# Claude Code Module — Event hook + MCP server options
#
# Hooks fire on Claude Code lifecycle events (preToolUse, sessionStart, etc.)
# and run as scripts in ~/.claude/hooks/. MCP servers expose Model Context
# Protocol tools/resources to the running session.
{ lib, ... }:
let
  inherit (import ./options-types.nix { inherit lib; }) mcpServerModule hookType;
in
{
  options.programs.claude = {
    # Hooks - fully implemented in modules/hooks.nix (typed per-event hooks)
    # plus modules/settings.nix (free-form pass-through).
    hooks = {
      preToolUse = lib.mkOption {
        type = hookType;
        default = null;
      };
      postToolUse = lib.mkOption {
        type = hookType;
        default = null;
      };
      userPromptSubmit = lib.mkOption {
        type = hookType;
        default = null;
      };
      stop = lib.mkOption {
        type = hookType;
        default = null;
      };
      subagentStop = lib.mkOption {
        type = hookType;
        default = null;
      };
      sessionStart = lib.mkOption {
        type = hookType;
        default = null;
      };
      sessionEnd = lib.mkOption {
        type = hookType;
        default = null;
      };

      worktreeCreate = lib.mkOption {
        type = hookType;
        default = null;
      };
      worktreeRemove = lib.mkOption {
        type = hookType;
        default = null;
      };

      # High-level toggle: wires worktreeCreate/worktreeRemove to vendored
      # scripts that replace Claude Code's built-in worktree placement.
      worktreesUnderRepo = lib.mkEnableOption ''
        repo-root worktree placement. When enabled, `EnterWorktree` and
        `--worktree` create every worktree at `<repo>/.worktrees/<name>/` on
        a branch named `<name>` (from `origin/HEAD` when known), and
        `ExitWorktree` removes that worktree and branch. Replaces the
        upstream default of `<repo>/.claude/worktrees/`.
      '';

      # High-level toggle: wires postToolUse to a vendored capture script.
      captureSessionOutput = lib.mkEnableOption ''
        session-output capture hook. When enabled, sets `postToolUse` to
        a vendored script that writes a compact summary of each tool
        invocation to `~/.cache/claude-last-output.txt` for statusline
        consumption.
      '';

      # High-level toggle: wires preToolUse to a vendored Agent-tool guard.
      blockExternalSubagentsInPrivateWorkspace = lib.mkEnableOption ''
        private-workspace subagent guard. When enabled, sets `preToolUse` to
        a vendored script that blocks Agent-tool spawns whose session cwd is
        under `$GIT_HOME_PRIVATE` while the router role `subagent` resolves
        to an external provider. A role target counts as internal when its
        base URL is loopback or sits in a domain named by the session's
        `CLAUDE_SUBAGENT_INTERNAL_DOMAINS` (space-separated); self-hosted
        models usually answer on another machine, so without that variable
        only loopback is treated as internal. Fail-open: an unset
        `GIT_HOME_PRIVATE` or `ANTHROPIC_BASE_URL`, or an unreachable router,
        allows the spawn and logs one line to stderr.
      '';

      # High-level toggle: wires sessionStart to a marketplace-refresh helper.
      refreshMarketplaces = lib.mkEnableOption ''
        marketplace-refresh hook. When enabled, sets `sessionStart` to a
        vendored script that asks Claude Code to re-read marketplace
        manifests at session start (useful after a Nix rebuild).
      '';

      # High-level toggle: wires preToolUse to a vendored keychain-read guard.
      # Shares the `preToolUse` slot with `blockExternalSubagentsInPrivateWorkspace`
      # — enabling both fails the Nix build (two `mkDefault` writers to one
      # option) rather than silently dropping one guard. Set `preToolUse`
      # to a script of your own that runs both checks if you need them
      # together.
      blockKeychainSecretReads = lib.mkEnableOption ''
        keychain secret-read guard. When enabled, sets `preToolUse` to a
        vendored script that denies a Bash `security find-generic-password`
        / `find-internet-password` call carrying `-w` or `-g` — either flag
        prints the secret value into the transcript. A lookup without those
        flags (existence/metadata only) still passes through.
      '';
    };

    mcpServers = lib.mkOption {
      type = lib.types.attrsOf mcpServerModule;
      default = { };
      description = ''
        MCP server definitions written to `~/.claude/settings.json` under
        `mcpServers`. Typed: stdio servers need `command`+`args`;
        sse/http servers need `url`.
      '';
    };
  };
}
