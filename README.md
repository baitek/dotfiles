# .dotfiles

Window manager: [sway](https://github.com/swaywm/sway)  
Terminal: [alacritty](https://github.com/alacritty/alacritty)  
Shell: Zsh + [Oh My Zsh!](https://ohmyz.sh/)  
Editor: [neovim](https://github.com/neovim/neovim)

## Thoughts about setup and choices

Using window manager instead of desktop environment makes the work much more 
productive, making the work much more seamless. At first I used 
[i3](https://i3wm.org/) and was perfectly happy with it. After gaining more 
knowledge, I switched to [sway](https://github.com/swaywm/sway) as it uses newer 
Wayland display server instead of X11. If I knew earlier, that sway does not 
support nvidia drivers, I probably wouldn't make a switch.

Alacritty is fast, comes with reasonable defaults and offers extensive 
customisation. It supports transparency, different fonts and works well on 
Wayland. 

Zsh with Oh My Zsh! seem to be good middleground between 
[bash](https://github.com/topics/bash) and 
[fish](https://github.com/fish-shell/fish-shell). It is easier to customise than
bash and in contrary to fish, Zsh is POSIX compliant.

Switch to NeoVim was single handedly inspired by ThePrimeagen. The whole setup 
is based on his 
[0 to LSP : Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE) 
video (used `lazy.nvim` instead of `packer.nvim`). The switch is really hard
and at start even painful, since stuff in IDE could be done so much quicker, 
but I really believe it is worth it. Using VIM motions is really starting to 
be fun and faster. Thought of getting rid of the mental overhead of using mouse 
is just awesome.

## Installation commands

FYI: I'm running Ubuntu, but next time will probably switch to Arch.

```
sudo apt update -y

# install fonts
## https://www.jetbrains.com/lp/mono/
## download, fc-cache to refresh, fc-list | grep font to verify

sudo apt install zsh
## chsh -s /usr/bin/zsh - to set default

# install alacritty from github
## with Wayland and postinstall procedures (including autocomplete)

sudo apt install sway grimes slurp wl-clipboard wofi
## configure sway
## configure wofi (replacement for drun)

# install oh My Zsh!
## ZSH=~/.config/oh-my-zsh sh install.sh - for correct path

sudo apt install ripgrep fd-find
# install neovim
## configure neovim

sudo apt install tmux
## install TPM (tmux plugin manager)
## TODO: learn, modify, add ss of terminal after
```

