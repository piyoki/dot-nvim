local settings = {}
-- `utils`                  --> Module required or at the beginning of the import file
-- `vim.cmd`                --> Used to execute Vim commands
-- `vim.api.nvim_command`   --> Used to execute NeoVim commands
-- `utils.opt`              --> Helper functions are used to set various Vim options in global, buffer, and window scope.

function settings.setup()
  local indent = 2 -- set indent number

  vim.cmd('syntax on') -- enable sytnax highlighting
  vim.cmd('filetype plugin indent on') -- enable auto indent

  -- global options
  vim.opt.expandtab = true -- convert tabs to spaces
  vim.opt.tabstop = indent -- insert the number of spaces for a tab
  vim.opt.shiftwidth = indent -- change the number of space characters inserted for indentation
  vim.opt.softtabstop = indent -- set the number of columns for a tab
  vim.opt.showtabline = indent -- always show tabline
  vim.opt.scrolloff = indent -- minimal number of screen lines to keep above and below the cursor
  vim.opt.spelllang = 'en_us' -- set spell check languages
  vim.opt.autochdir = true -- change the current working directory whenever opening a file
  vim.opt.autoindent = false -- enable auto indent
  vim.opt.wrap = true -- wrap text
  vim.opt.signcolumn = 'yes' -- always show the signcolumn, or it would shift the text each time
  -- vim.opt.hidden = true -- when off a buffer is unloaded when it is abandoned
  vim.opt.shiftround = true -- round indent to multiple of 'shiftwidth', apply to >, <
  vim.opt.smartcase = true -- enable smartcase
  vim.opt.smarttab = true -- enable smarttab
  vim.opt.smartindent = false -- enable smartindent
  vim.opt.splitbelow = true -- horizontal splits will automatically be below
  vim.opt.splitright = true -- vertical splits will automatically be right
  vim.opt.ruler = true -- show the cursor position all the time
  vim.opt.updatetime = 100 -- faster completion
  vim.opt.timeoutlen = 300 -- time in milliseconds to wait for a mapped sequence to complete
  vim.opt.cmdheight = 1 -- more space for displaying messages, default 1
  vim.opt.completeopt = 'menuone,noselect' -- a comma separated list of options for Insert mode completion

  -- window scope options
  vim.opt.number = true -- enable linenumber
  vim.opt.relativenumber = true -- enable relative linenumber
  vim.opt.termguicolors = true -- enable termguicolors
  vim.opt.cursorline = true -- enable highlighting of the current line
  vim.opt.foldmethod = 'indent' -- The kind of folding used for the current window
  vim.opt.foldlevel = 99 -- the foldlevel of line
  vim.opt.foldenable = false -- disable open all fold
  vim.opt.fillchars = 'eob: ' -- characters to fill the statuslines and vertical separators. eob: ~
  vim.opt.spell = true -- set spell check

  -- Searching
  vim.opt.hlsearch = true -- enable highlight search
  vim.opt.incsearch = true -- enable inline search
  vim.opt.ignorecase = true -- enable ignore case sensitivity
  vim.opt.smartcase = true -- enable smart casing

  -- Extras
  vim.opt.textwidth = 0 -- default textwidth
  vim.opt.viewoptions = 'cursor,slash,folds,unix' -- default viewoptions

  -- Highlight on yank
  vim.cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')

  -- Clipboard & Mouse
  vim.opt.clipboard = 'unnamedplus'
  vim.opt.mouse = 'a'
end

return settings
