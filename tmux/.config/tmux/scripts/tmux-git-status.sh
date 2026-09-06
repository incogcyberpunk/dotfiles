#!/usr/bin/env sh

repo=$1
green=$2
crust=$3
foreground=$4
surface=$5
status_background=$6

branch=$(git -C "$repo" symbolic-ref --quiet --short HEAD 2>/dev/null) ||
    branch=$(git -C "$repo" rev-parse --short HEAD 2>/dev/null) || exit 0

# ponytail: ignore untracked files to keep the five-second refresh cheap;
# replace diff-index with `git status --porcelain` if untracked state is needed.
dirty=
git -C "$repo" diff-index --quiet HEAD -- 2>/dev/null || dirty='*'

printf ' #[fg=%s,bg=%s]#[fg=%s,bg=%s] #[fg=%s,bg=%s] %s%s #[fg=%s,bg=%s]' \
    "$green" "$status_background" "$crust" "$green" "$foreground" "$surface" "$branch" "$dirty" "$surface" "$status_background"
