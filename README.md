# Neovim Setup

<!-- vim-markdown-toc GFM -->

* [Neovim 0.5.0+ New Features](#neovim-050-new-features)
* [Reference](#reference)
* [Installation](#installation)
  * [Install Dependency Packages](#install-dependency-packages)
* [Getting Started with Lua-Based Neovim config](#getting-started-with-lua-based-neovim-config)
  * [Benefits](#benefits)
  * [Lua Keybings](#lua-keybings)
  * [Package Management](#package-management)
* [Plugins](#plugins)
    * [Core](#core)
    * [Lua Native](#lua-native)
    * [Editing Addons](#editing-addons)
    * [Prerequisite:](#prerequisite)
    * [LSP Addons](#lsp-addons)
    * [Formatter Addons](#formatter-addons)
    * [Extra Addons](#extra-addons)

<!-- vim-markdown-toc -->

## Neovim 0.5.0+ New Features

- all the IDE-like goodies:
- LSP completion, go to def, hover and rename
- treesitter syntax highlighting
- ctrlp-like fuzzy finding
- embedded terminals

## Reference

- [Neovim — init.lua](https://ichi.pro/neovim-init-lua-255152448823344)
- [Collections of awesome Neovim plugins](https://github.com/rockerBOO/awesome-neovim)
- [Getting started using Lua in Neovim](https://github.com/nanotee/nvim-lua-guide)

## Installation

### Install Dependency Packages

```bash
# MacOS
brew install --HEAD tree-sitter luajit neovim fzf fd

# Archlinux
sudo pacman -S tree-sitter luajit neovim fzf fd
```

<details><summary>Install nvim-lspconfig</summary>
</br>

reference: https://github.com/neovim/nvim-lspconfig

</details>

<details><summary>Install nvim-lsp-installer</summary>
</br>

reference: https://github.com/williamboman/nvim-lsp-installer

</details>

## Getting Started with Lua-Based Neovim config

### Benefits

- Lua is a much nicer language
- More modular
- Easier to customize
- Easier to configure lua plugins

### Lua Keybings

Set using `vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})`

<details><summary>Example</summary>
</br>

```vim
" Ctrl-s to Save
nmap <c-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

" Ctrl+hjkl to navigate splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
```

Now converted to

```lua
local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', ':<Esc>:w<CR>a', {})

local opts = {noremap = true}
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
```

</details>

### Package Management

Use `Packer` as the default plugin manager

In `Archlinux`, we can install from AUR: `yay -S nvim-packer-git`

Start with having packer manage itself:

```lua
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  -- add other use ... for other packages
end)
```

Then we can run `:PackerSync` which will download/install the list of defined plugins

## Plugins

#### Core

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - a collection of configurations for Neovim's built-in LSP
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - syntax highlight for Neovim's built-in LSP
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - extendable fuzzy finder over lists

#### Lua Native

- [lualine](https://github.com/nvim-lualine/lualine.nvim) - a blazing fast and easy to configure Neovim statusline written in Lua

#### Editing Addons

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - completion engine
- [vim-surround](https://github.com/tpope/vim-surround) - mappings to easily delete, change and add surroundings in pairs
- [formatter.nvim](https://github.com/mhartington/formatter.nvim) - A format runner for neovim, written in lua

#### Prerequisite:

- nodejs
- npm
- yarn

```bash
# Install yarn
sudo npm i -g yarn
```

#### LSP Addons

```bash
# gopls
go install golang.org/x/tools/gopls@latest
# golangci-lint
go install github.com/golangci/golangci-lint/cmd/golangci-lint@lastet
```

#### Formatter Addons

```bash
# go formatter (comes with the go binary)
sudo pacman -S go
# lua formatter
sudo pacman -S stylua
# shell script formatter
sudo pacman -S shfmt
# ctags
sudo pacman -S ctags
# typescript, javascript, markdown, JSON formatter
sudo npm install -g prettier
# yamlfmt
pip3 install yamlfmt
# python formatter
pip3 install black
# ruby formatter (required PATH setup)
gem install rubocop
# terragrunt(terraform) formatter (comes with terragrunt/terraform)
sudo pacman -S terraform terragrunt
```

#### Extra Addons

- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - markdown preview plugin for (neo)vim
