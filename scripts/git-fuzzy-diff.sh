#!/bin/bash

# Check if we are in a git repo
if ! git rev-parse --git-dir &> /dev/null; then
    echo -e "Not in a git repository.\nExiting ..."
    exit 1
fi

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
    echo "fzf is not installed. Please install it and try again."
    exit 1
fi

modified_files=$(git diff --name-only)

selected_file=$(echo "$modified_files" | fzf --reverse -m --header "Browser Git diff" --preview 'git diff --color=always -- {-1} | diff-so-fancy')

# Exit if no file is selected
if [ -z "$selected_file" ]; then
    exit 0
fi

session_name="diff-"$(basename "$selected_file" | sed 's/\(.*\)\./\1_/')

if ! tmux has-session -t=$session_name 2> /dev/null; then
  # tmux new-session -ds $session_name -n "$selected_file"
  tmux new-session -ds $session_name -n "$selected_file" "nvim -c ':Gdiffsplit' $selected_file"
fi

# check if within tmux and adapt so we avoid nesting
if [[ -z $TMUX ]]; then
  echo 'not in tmux'
  tmux attach-session -t $session_name
else
  echo 'in tmux'
  tmux switch-client -t $session_name
fi
