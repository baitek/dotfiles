# .dotfiles

Window manager: [sway](https://github.com/swaywm/sway)  
Terminal: [alacritty](https://github.com/alacritty/alacritty)  
Shell: [Zsh](https://www.zsh.org/) + [Oh My Zsh!](https://ohmyz.sh/)  
Editor: [neovim](https://github.com/neovim/neovim)  
Terminal multiplexer: [tmux](https://github.com/tmux/tmux)

## Thoughts about setup and choices

Using window manager instead of desktop environment has an advantage of not having any mental overload. Using [sway](https://github.com/swaywm/sway) for that purpose, as it uses Wayland display server instead of X11.

[Alacritty](https://github.com/alacritty/alacritty) is fast, comes with reasonable defaults and offers extensive customisation. Additionally it supports transparency and works well on Wayland.

[Zsh](https://www.zsh.org/) with [Oh My Zsh!](https://ohmyz.sh/) seem to be good middleground between [bash](https://www.gnu.org/software/bash/) and [fish](https://fishshell.com/). It is easier to customise than bash, and in contrary to fish, Zsh is POSIX compliant.

Switch to [neovim](https://github.com/neovim/neovim) was single handedly inspired by ThePrimeagen. The switch is honestly quite tough, as I'm used to IDE an am much faster using it, but I really believe, that the transition is worth it. Thought of getting rid of the mental overhead of using mouse is just awesome.

As for terminal multiplexer, [tmux](https://github.com/tmux/tmux) allows saving sessions, splitting panes, easier navigation between projects and splitting the screen.

## Installation commands

FYI: I'm running Ubuntu.

```
sudo apt update -y

# install nerdfonts
## download, fc-cache to refresh, fc-list | grep font to verify

sudo apt install zsh
## chsh -s /usr/bin/zsh - to set default

# install oh My Zsh!
## ZSH=~/.config/oh-my-zsh sh install.sh - for correct path

# install alacritty from github (preferably fork with DynamicCopy)
## with Wayland and following postinstall procedures

sudo apt install sway grimes slurp wl-clipboard wofi
## configure sway
## configure wofi

sudo apt install neovim fzf ripgrep fd-find
## configure neovim

sudo apt install tmux
## configure tmux
## install tmux tpm
```
