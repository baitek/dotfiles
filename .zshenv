. "$HOME/.cargo/env"
export GTK_THEME=Tokyonight-Dark-BL
export PATH="$PATH:/usr/local/go/bin"
if [[ -z $TMUX ]]; then
    export PATH="$PATH:/home/$(whoami)/.scripts"
fi
