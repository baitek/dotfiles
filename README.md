# dotfiles

[~~Turns out light mode is better for the eyes
🤯~~](https://www.allaboutvision.com/digital-eye-strain/is-dark-mode-better-for-eyes/)

Turns out I don't care that much, my eyes were never hurting using dark mode
and Tokyo Night Moon more well adjusted.

[![Setup image](setup.png)](setup.png)

Window manager: [Sway](https://github.com/swaywm/sway)  
Terminal: [WezTerm](https://github.com/wez/wezterm)  
Shell: [Zsh](https://www.zsh.org/) + [Oh My Zsh!](https://ohmyz.sh/)  
Editor: [NeoVim](https://github.com/neovim/neovim)  
Terminal multiplexer: [tmux](https://github.com/tmux/tmux)

## Setup

[Sway](https://github.com/swaywm/sway) is a tilling Wayland compositor that can
be easily managed using only keyboard. Using it instead of desktop environment
has an advantage of not having mental overload of using `ALT+TAB` and mouse.

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

If package isn't available/up-to date in `apt`, then use `Appimage`/binary and
put it in `/usr/local/bin`.

### Ubuntu

```bash sudo apt update -y sudo apt install sway grim wofi ripgrep fd-find tmux
wdisplays \ xdg-desktop-portal-wlr zsh dunst git unzip make gcc jq
ffmpegthumbnailer unar \ zoxide poppler-utils slurp wl-clipboard libfuse2 curl
nodejs npm ```

This leaves following to install:

- [Neovim](https://neovim.io/) - AppImage
- [WezTerm terminal](https://wezfurlong.org/wezterm/) - AppImage
- [Obsidian](https://obsidian.md/) - AppImage
(<https://github.com/electron/electron/issues/42510#issuecomment-2171583086>)
- [Oh My Zsh! framework](https://ohmyz.sh/) - install with specified path:
`ZSH=~/.config/oh-my-zsh sh install.sh`
- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) - install plugins
using `<prefix-I>` to install plugins
- [fzf](https://junegunn.github.io/fzf/) - get latest binary
- [NerdFonts](https://github.com/ryanoasis/nerd-fonts) - download, extract to
`/usr/local/share/fonts`, `fc-cache` to refresh, `fc-list | grep <font>` to
verify
- [Yazi terminal file manager](https://github.com/sxyazi/yazi)
- [Rust](https://www.rust-lang.org) - use rustup
- [Go](https://go.dev/) - install folder in `/usr/local`
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/) and
[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- Oh My Zsh install
- [LazyGit](https://github.com/jesseduffield/lazygit) -
