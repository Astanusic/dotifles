#!/bin/bash

# Check if we are in a git repo
if ! git rev-parse --git-dir &> /dev/null; then
   echo -e "\033[1;31mNot in a git repository.\nExiting ...\033[0m"
   # echo -e "Not in a git repository.\nExiting ..."
    exit 1
fi

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
    echo -e "\033[1;31mfzf is not installed. Please install it and try again.\033[0m"
    exit 1
fi

selected_branch=$(git branch | fzf -m --header "Browse Git branches" --preview="git diff main {-1} | diff-so-fancy")

# Exit if no file is selected
if [ -z "$selected_branch" ]; then
    exit 0
fi

git checkout $selected_branch
