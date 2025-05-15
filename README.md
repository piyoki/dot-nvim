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
