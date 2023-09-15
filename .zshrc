# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="custom_theme"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#
# User configuration
#

# Disable ctrl+s in Alacritty
stty -ixon

# Preserve history
HISTFILE=/home/bartek/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Fix ctrl+left and ctrl+right in terminal
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Set paths for to pickup .desktop after Flatpak installation
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/bartek/.local/share/flatpak/exports/share"

# Disable highlight after pasting text to console
unset zle_bracketed_paste 

