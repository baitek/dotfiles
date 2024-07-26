#!/usr/bin/env bash

# Credits to ThePrimeagen
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-cht.sh

selected=$(cat ~/.config/tmux/tmux-cht-languages ~/.config/tmux/tmux-cht-command | fzf)
if [[ -z $selected ]]; then
	exit 0
fi

if grep -qs "$selected" ~/.config/tmux/tmux-cht-languages; then
	read -r -p "Enter Query: " query
	query=$(echo "$query" | tr ' ' '+')
	tmux neww bash -c "curl -s cht.sh/$selected/$query | less"
else
	tmux neww bash -c "curl -s cht.sh/$selected | less"
fi
