# .dotfiles

Window manager: [sway](https://github.com/swaywm/sway)  
Terminal: [alacritty](https://github.com/alacritty/alacritty)  
Shell: [Zsh](https://www.zsh.org/) + [Oh My Zsh!](https://ohmyz.sh/)  
Editor: [neovim](https://github.com/neovim/neovim)  
Terminal multiplexer: [tmux](https://github.com/tmux/tmux)

## Thoughts about setup and choices

Using window manager instead of desktop environment has an advantage of not having any mental overload. Using [sway](https://github.com/swaywm/sway) for that purpose, as it uses Wayland display server instead of X11.

[Alacritty](https://github.com/alacritty/alacritty) terminal is fast, comes with reasonable defaults and offers extensive customisation. Additionally it supports transparency and works well on Wayland.

[Zsh](https://www.zsh.org/) with [Oh My Zsh!](https://ohmyz.sh/) seem to be good middleground between [bash](https://www.gnu.org/software/bash/) and [fish](https://fishshell.com/). It is easier to customise than bash, and in contrary to fish, Zsh is somewhat POSIX compliant.

Switch to [neovim](https://github.com/neovim/neovim) was single handedly inspired by ThePrimeagen. The main advantages coming from this change are:
- environment that encourages learning
- keyboard only (no mental overload of switching to mouse)
- customized IDE
It's not easy, as I'm used to IDE, but I think, that the transition is worth it.

As for terminal multiplexer, [tmux](https://github.com/tmux/tmux) allows saving sessions, splitting panes and easier navigation between projects.

## Installation commands

FYI: I'm running Ubuntu.

```
sudo apt update -y
sudo apt install sway grimes slurp wl-clipboard wofi \
  neovim ripgrep fzf fd-find tmux \
  pipewire wdisplays xdg-desktop-portal-wlr
# install nerdfonts (download, `fc-cache` to refresh, `fc-list | grep font` to verify)

# configure neovim
# install Alacritty (update fork with DynamicCopy)
# install zsh (`chsh -s /usr/bin/zsh` to set as default)
# install oh My Zsh! (`ZSH=~/.config/oh-my-zsh sh install.sh` for path alligned with this repo)
# configure tmux together with TPM
# configure pipewire
# configure sway, wofi
# install dunstrc (with dunstctl)
```
