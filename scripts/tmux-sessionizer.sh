#!/usr/bin/env bash


# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
  echo -e "fzf is not installed.\nPlease install it and try again."
  exit 
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
  echo -e "git is not installed.\nPlease install it and try again."
  exit 
fi

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find ~/Dev ~/Dev/sites/projects ~/Dev/sites/otherPeople/madjtaha ~/Dev/sites/otherPeople/brsimon ~/Dev/sites/otherPeople/codrops  ~/Dev/sites/prototypes ~/Dev/python ~/Dev/bash ~/.config ~/.local/bin \
    -mindepth 1 -maxdepth 1 -type d | fzf --reverse --header "Select a project" \
    --preview 'echo -e "\033[31m$(basename {})\033[0m"; echo "Recently modified files:"; ls -lt --color=always {} | head -n 6 | awk "{print \$6,\$7,\$8, \$9}"' )
fi

if [[ -z $selected ]]; then
  exit 
fi

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t=$selected_name 2> /dev/null; then

  layout=$(echo -e "1. One way\n2. Two ways\n3. Three ways\n4. Four ways\n5. Five ways" | fzf --reverse --header "Select layout")

  # create tmux session based on layout selection
  if [[ $layout == "1. One way" ]]; then
    tmux new-session -ds $selected_name -n $selected_name -c $selected

  elif [[ $layout == "2. Two ways" ]]; then
    tmux new-session -ds $selected_name -n "dev" -c $selected
    tmux new-window -d -n "localserv" -t $selected_name -c $selected

  elif [[ $layout == "3. Three ways" ]]; then
    tmux new-session -ds $selected_name -n "dev" -c $selected
    tmux new-window -d -n "dev 1" -t $selected_name -c $selected
    tmux new-window -d -n "localserv" -t $selected_name -c $selected

  elif [[ $layout == "4. Four ways" ]]; then
    tmux new-session -ds $selected_name -n "dev" -c $selected
    tmux new-window -d -n "dev 2" -t $selected_name -c $selected
    tmux new-window -d -n "dev 3" -t $selected_name -c $selected
    tmux new-window -d -n "localserv" -t $selected_name -c $selected

  elif [[ $layout == "5. Five ways" ]]; then
    tmux new-session -ds $selected_name -n "dev" -c $selected
    tmux new-window -d -n "dev 2" -t $selected_name -c $selected
    tmux new-window -d -n "dev 3" -t $selected_name -c $selected
    tmux new-window -d -n "dev 4" -t $selected_name -c $selected
    tmux new-window -d -n "localserv" -t $selected_name -c $selected

  else
    echo "Invalid selection"
    exit 1
  fi
fi

# check if within tmux and adapt so we avoid nesting
if [[ -z $TMUX ]]; then
  echo 'not in tmux'
  tmux attach-session -t $selected_name
else
  echo 'in tmux'
  tmux switch-client -t $selected_name
fi
