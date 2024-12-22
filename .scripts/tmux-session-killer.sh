#!/bin/bash

set -e

selected_session=$(tmux list-sessions -F '#S' | grep -v "$HOME" | fzf)

if [[ -z $selected_session ]]; then
  exit 0
fi

read -p "Remove session $selected_session [y/n]: " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  current_session=$(tmux display-message -p '#S')
  if [[ $current_session == $selected_session ]]; then
    tmux switch-client -t $HOME
  fi
  tmux kill-session -t "$selected_session"
  echo "Done."
else
  echo "Canceling."
fi
