--  __  __         _             _       _ _
-- |  \/  |_   _  | |_   _  __ _(_)_ __ (_) |_
-- | |\/| | | | | | | | | |/ _` | | '_ \| | __|
-- | |  | | |_| | | | |_| | (_| | | | | | | |_
-- |_|  |_|\__, | |_|\__,_|\__,_|_|_| |_|_|\__|
--         |___/

-- Author: Kevin Yu (@github.com/yqlbu)

local fn = vim.fn
local cmd = vim.cmd
local nvim_cmd = vim.api.nvim_command

-- Auto install packer.nvim if not exists --
---------------------------------------------------
local function packer_init()
  local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    nvim_cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  end
  cmd([[packadd packer.nvim]])
  cmd('autocmd BufWritePost plugins.lua PackerCompile') -- Auto compile when there are changes in plugins.lua
end

-- Loading modules ---
---------------------------------------------------

packer_init()

-- Modules --
require('plugins')
require('core.settings').setup()
require('ide').setup()
require('core.keymap').setup()
require('core.autocmd').setup()
require('config').setup()
