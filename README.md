# Neovim

Personal Neovim config

## Setup

Managed from the dotfiles repo as a submodule at `nvim/.config/nvim`:

```sh
git submodule update --init nvim/.config/nvim
stow nvim
```

Standalone install:

```sh
git clone git@github.com:sunanmau5/nvim.git ~/.config/nvim
```

Plugins are managed with `lazy.nvim`, which bootstraps itself on first launch

## Notes

- LSP and plugins are skipped inside VSCode
- Local plugins live in `local/`
