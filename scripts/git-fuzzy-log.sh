#!/bin/bash

# Check if we are in a git repo
if ! git rev-parse --git-dir &> /dev/null; then
    echo -e "Not in a git repository.\nExiting ..."
    exit 1
fi

if ! command -v fzf &> /dev/null; then
    echo -e "fzf is not installed.\nPlease install it and try again."
    exit 1
fi

gitLogLineToHash="echo -n {} | grep -o '[a-f0-9]\{7\}' | head -1 | tr -d '\n'"
viewGitLogLine="$gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"
viewGitLogLineUnfancy="$gitLogLineToHash | xargs -I % sh -c 'git show %'"

git log \
  --color=always \
  --format="%C(cyan)%h %C(blue)%ar%C(auto)%d \
            %C(yellow)%s%+b %C(black)%ae" "$@" |
  fzf -i -e +s \
    --reverse \
    --tiebreak=index \
    --no-multi \
    --preview="echo {} |
                grep -o '[a-f0-9]\{7\}' |
                head -1 |
                xargs -I % sh -c 'git show --color=always % |
                diff-so-fancy'" \
    --header "Enter: view, <C-h> copy (h)ash, <C-v> open in nvim" \
    --bind "enter:execute:$viewGitLogLine | less -R" \
    --bind "ctrl-v:execute:$viewGitLogLineUnfancy | nvim -" \
    --bind "ctrl-h:execute:$gitLogLineToHash | pbcopy"

