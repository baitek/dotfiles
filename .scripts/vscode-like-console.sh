#!/bin/bash

# Script for tmux to create toggleable pane similar to the one in VsCode.
# In the implementation, one vscode pane is used per session session.

# Pane vscode-like-console doesn't exist, create new
if ! grep -q vscode-like-console <(tmux list-panes -s -F "#{pane_title}"); then
  tmux split-window -fv -l 20%
  tmux select-pane -T vscode-like-console
  exit
fi

# Pane vscode-like-console is shown, hide it
if grep -q vscode-like-console <(tmux list-panes -F "#{pane_title}"); then
  vscode_pane_index=$(tmux list-panes -F "#{pane_title}#{pane_index}" | grep -oP '(?<=vscode-like-console).*')
  tmux break-pane -d -s "$vscode_pane_index" -t 9
  tmux rename-window -t 9 vscode-like-console
else # Pane vscode-like-console is hidden, show it
  vscode_pane=$(tmux list-panes -s -F "#{pane_title}#S:#{window_index}.#{pane_index}" | grep -oP '(?<=vscode-like-console).*')
  tmux join-pane -fv -l 20% -s "$vscode_pane"
fi
