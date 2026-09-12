#!/usr/bin/env bash
# Regression test for modules/hooks/worktree-create.sh and worktree-remove.sh.
#
# Run as a Nix check (see flake/checks.nix), which supplies:
#   CREATE  store path of the create hook
#   REMOVE  store path of the remove hook
#   out     file to write the success marker to

set -euo pipefail

export HOME=$TMPDIR
export GIT_AUTHOR_NAME=t GIT_AUTHOR_EMAIL=t@t GIT_COMMITTER_NAME=t GIT_COMMITTER_EMAIL=t@t

repo=$TMPDIR/repo
git init -q -b main "$repo"
git -C "$repo" commit -q --allow-empty -m init

# Create lands at <repo>/.worktrees/<name> on branch <name>, path on stdout.
path=$(jq -nc --arg cwd "$repo" '{name:"feat-x",cwd:$cwd}' | bash "$CREATE" 2>/dev/null | tail -n1)
[ "$path" = "$repo/.worktrees/feat-x" ] || {
  echo "expected $repo/.worktrees/feat-x, got: $path" >&2
  exit 1
}
[ "$(git -C "$path" symbolic-ref --short HEAD)" = "feat-x" ] || {
  echo "expected branch feat-x in the new worktree" >&2
  exit 1
}

# Create from inside an existing worktree still resolves the repo root.
path2=$(jq -nc --arg cwd "$path" '{name:"feat-y",cwd:$cwd}' | bash "$CREATE" 2>/dev/null | tail -n1)
[ "$path2" = "$repo/.worktrees/feat-y" ] || {
  echo "expected $repo/.worktrees/feat-y, got: $path2" >&2
  exit 1
}

# Remove drops the worktree and its branch.
jq -nc --arg p "$path" '{worktree_path:$p}' | bash "$REMOVE" 2>/dev/null
[ ! -d "$path" ] || {
  echo "expected $path to be removed" >&2
  exit 1
}
if git -C "$repo" rev-parse --verify --quiet refs/heads/feat-x >/dev/null; then
  echo "expected branch feat-x to be deleted" >&2
  exit 1
fi

# Remove of an absent path is a no-op.
jq -nc '{worktree_path:"/nonexistent/wt"}' | bash "$REMOVE" 2>/dev/null

touch "$out"
