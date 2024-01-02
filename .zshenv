. "$HOME/.cargo/env"
export PATH="$PATH:/usr/local/go/bin"
if [[ -z $TMUX ]]; then
    export PATH="$PATH:/home/$(whoami)/.scripts"
fi
