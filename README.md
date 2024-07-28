# dotfiles

Window manager: [Sway](https://github.com/swaywm/sway)  
Terminal: [WezTerm](https://github.com/wez/wezterm)  
Shell: [Zsh](https://www.zsh.org/) + [Oh My Zsh!](https://ohmyz.sh/)  
Editor: [NeoVim](https://github.com/neovim/neovim)  
Terminal multiplexer: [tmux](https://github.com/tmux/tmux)

## Setup

[Sway](https://github.com/swaywm/sway) is a window manager that uses Wayland
display server (more secure alternative to X11). Using it instead of desktop
environment has an advantage of not having mental overload of using `ALT+TAB`
and allows switching tabs without thinking. Having terminal under `<prefix>+1`,
browser under `<prefix>+2` is now instilled in my memory.

[WezTerm](https://github.com/wez/wezterm) is a GPU-accelerated terminal that
has great documentation and is configurable using Lua.

[Zsh](https://www.zsh.org/) shell used with [Oh My Zsh!](https://ohmyz.sh/)
framework is easier to use and configure than
[bash](https://www.gnu.org/software/bash/) and in contrary to
[fish](https://fishshell.com/) is highly POSIX complaint.

[NeoVim](https://github.com/neovim/neovim) is a fast and highly extensible
editor built on top of Vim.

[tmux](https://github.com/tmux/tmux) is a terminal multiplexer of choice.
Allows saving sessions, splitting panes, easier navigation between projects and
more. A lot of mentioned features are implemented by
[WezTerm](https://github.com/wez/wezterm), but I've grown used to
[tmux](https://github.com/tmux/tmux) and don't feel the need to change.

## Installation commands

### Ubuntu

```bash
sudo apt update -y
sudo apt install sway grimes wofi neovim ripgrep fzf fd-find tmux wdisplays \
  xdg-desktop-portal-wlr zsh dunst git unzip make gcc jq ffmpegthumbnailer unar \
  zoxide poppler-utils slurp wl-clipboard brave-browser obsidian

# set zsh as default shell
chsh -s /usr/bin/zsh
```

This leaves following to install:

- [WezTerm terminal](https://github.com/wez/wezterm)
- [Oh My Zsh! framework](https://ohmyz.sh/) - install with specified path:
  `ZSH=~/.config/oh-my-zsh sh install.sh`
- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
- [NerdFonts](https://github.com/ryanoasis/nerd-fonts) - download, extract to
  `/usr/local/share/fonts`, `fc-cache` to refresh, `fc-list | grep <font>` to
  verify
- [Yazi terminal file manager](https://github.com/sxyazi/yazi)

### Arch

```bash
sudo pacman -Sy
sudo pacman -S wezterm ttf-nerd-fonts-symbols-mono sway swaybg swayidle swaylock wl-clipboard slurp neovim wofi git unzip make gcc ripgrep fzf tmux xdg-desktop-portal-wlr zsh dunst jq ffmpegthumbnailer zoxide obsidian rsync poppler grim fd yazi unarchiver luarocks go npm python-pip

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
sudo yay -S brave-bin wdisplays
```

## Next steps

- learn GNU Stow to stop using `bootstrap.sh` script
- continue improving at [NeoVim](https://github.com/neovim/neovim)
  - improve at jumping/editing between the project (GOTO definition, go back
    with `<C-t>` or `<C-^>`, multiline editing, Telescope with `<C-q>` and
    `:cpo`)
  - learn using quicklist
  - use [vim-dadbod](https://github.com/tpope/vim-dadbod) for SQl
  - use [nvim-dap](https://github.com/mfussenegger/nvim-dap) for debugging
