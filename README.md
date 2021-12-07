# dotfiles-bare
Drastically simplifying dotfiles management.

Based upon the following [setup](https://mjones44.medium.com/storing-dotfiles-in-a-git-repository-53f765c0005d)

Allows bootstrapping a system (vim, git, ssh, etc).

## Applications Bootstrapped

* [fzf](https://github.com/junegunn/fzf) command-line fuzzy finder
* [bat](https://github.com/sharkdp/bat) `cat` clone with syntax highlighting

### `zsh`

* [oh-my-zsh|https://ohmyz.sh/] zsh framework
* [antigen|https://github.com/zsh-users/antigen] zsh plugin manager

**plugins**
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions.git)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)

**themes**
* dracula (default)
* powerlevel10k

### `vim` plugins

Current list of VIM plugins which are installed via vim-plug plugin manager
* [vim-plug](https://github.com/junegunn/vim-plug)
* [nerdtree](https://github.com/preservim/nerdtree)
* [vim-airline](https://github.com/vim-airline/vim-airline)
** vim-airline-theme
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [Conquer of Completion](https://github.com/neoclide/coc.nvim)

### `starship`
[starship](https://starship.rs/) _(optional)_ installed and bootstrapped.

## Getting Started

These instructions will give you a copy of the project up and running on
your local machine for bootstrapping a new system.

### Installing

1.  Clone repository
```bash
git clone https://github.com/dmorand17/bootstrappah.git && cd bootstrappah
```
