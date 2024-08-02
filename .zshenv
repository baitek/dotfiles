export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#b7c1e3 \
  --color=bg:#d0d5e3 \
  --color=border:#4094a3 \
  --color=fg:#3760bf \
  --color=gutter:#d0d5e3 \
  --color=header:#b15c00 \
  --color=hl+:#188092 \
  --color=hl:#188092 \
  --color=info:#8990b3 \
  --color=marker:#d20065 \
  --color=pointer:#d20065 \
  --color=prompt:#188092 \
  --color=query:#3760bf:regular \
  --color=scrollbar:#4094a3 \
  --color=separator:#b15c00 \
  --color=spinner:#d20065 \
"

. "$HOME/.cargo/env"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
if [[ -z $TMUX ]]; then
    export PATH="$PATH:/home/$(whoami)/.scripts"
fi
