# Single source of truth mapping typed `programs.claude.hooks.<name>`
# options to their materialized script filename under `~/.claude/hooks/`
# and Claude Code's settings.json event name.
#
# Consumed by `modules/hooks.nix` (writes the script file) and
# `modules/settings.nix` (registers the script under `settings.json`'s
# `hooks` key so Claude Code actually invokes it — writing the file alone
# does nothing, since Claude Code has no directory-convention discovery).
{
  preToolUse = {
    fileName = "pre-tool-use.sh";
    claudeEvent = "PreToolUse";
  };
  postToolUse = {
    fileName = "post-tool-use.sh";
    claudeEvent = "PostToolUse";
  };
  userPromptSubmit = {
    fileName = "user-prompt-submit.sh";
    claudeEvent = "UserPromptSubmit";
  };
  stop = {
    fileName = "stop.sh";
    claudeEvent = "Stop";
  };
  subagentStop = {
    fileName = "subagent-stop.sh";
    claudeEvent = "SubagentStop";
  };
  sessionStart = {
    fileName = "session-start.sh";
    claudeEvent = "SessionStart";
  };
  sessionEnd = {
    fileName = "session-end.sh";
    claudeEvent = "SessionEnd";
  };
  worktreeCreate = {
    fileName = "worktree-create.sh";
    claudeEvent = "WorktreeCreate";
  };
  worktreeRemove = {
    fileName = "worktree-remove.sh";
    claudeEvent = "WorktreeRemove";
  };
}
