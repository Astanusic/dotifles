#!/usr/bin/env bash

if ! tmux has-session; then
    exit 0
fi


if [[ -z $TMUX ]]; then
  selected=$(tmux list-sessions | fzf --header 'Select session')

  if [[ -z $selected ]]; then
    exit 0
  fi

  session=$(echo $selected | grep -oE '^[^:]+')
  tmux attach-session -t $session
fi
