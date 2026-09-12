# Hook bodies for `programs.claude.hooks.worktreesUnderRepo`.
#
# Claude Code's `WorktreeCreate` hook replaces built-in placement: it reads
# `{name, cwd}` on stdin and takes the last stdout line as the worktree path.
# `WorktreeRemove` reads `{worktree_path}`. The repository root is the parent
# of `git rev-parse --git-common-dir`, so both work from inside a worktree.
{
  create = ''
    #!/usr/bin/env bash
    set -euo pipefail
    input=$(cat)
    name=$(jq -r '.name' <<<"$input")
    cwd=$(jq -r '.cwd' <<<"$input")
    root=$(dirname "$(git -C "$cwd" rev-parse --path-format=absolute --git-common-dir)")
    path="$root/.worktrees/$name"
    if git -C "$cwd" rev-parse --verify --quiet "refs/heads/$name" >/dev/null; then
      git -C "$cwd" worktree add "$path" "$name" >&2
    else
      base=$(git -C "$cwd" rev-parse --verify --quiet refs/remotes/origin/HEAD >/dev/null && echo origin/HEAD || echo HEAD)
      git -C "$cwd" worktree add -b "$name" "$path" "$base" >&2
    fi
    echo "$path"
  '';

  remove = ''
    #!/usr/bin/env bash
    set -euo pipefail
    path=$(jq -r '.worktree_path' <<<"$(cat)")
    [[ -d $path ]] || exit 0
    branch=$(git -C "$path" symbolic-ref --quiet --short HEAD || true)
    git -C "$path" worktree remove --force "$path" >&2
    [[ -z $branch ]] || git -C "$(dirname "$path")" branch -D "$branch" >&2
  '';
}
