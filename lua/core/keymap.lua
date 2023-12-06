local M = {}

local wk = require('which-key')
local utils = require('utils')
local builtin_lsp = require('builtin.lsp')
local telescope_builtin = require('telescope.builtin')
local opts = { noremap = true, silent = true }

function M.setup()
  -- Map leader to space
  vim.g.mapleader = ' '

  -- Which-key setup
  wk.setup()

  -- Insert Mode Bindings
  utils.map('i', 'jj', '<Esc>:w<CR>', opts) -- (I) Switch to normal mode and save
  utils.map('i', '<C-o>', '<Esc>o', opts) -- (I) Insert a new line

  -- Save, Quit, and Reload
  utils.map('', 's', '<nop>', opts)
  utils.map('n', 'S', ':w<CR>', opts) -- (N) Save
  utils.map('n', 'Q', '<nop>', opts) -- (N) Unbind quit
  utils.map('n', '<A-w>', ':BufferClose<CR>', opts) -- (N) Close current buffer
  utils.map('n', 'R', ':source%<CR>', opts) -- (N) Reload
  utils.map('n', '<C-r>', ':bufdo! e<CR>', opts) -- (N) Reload

  -- Navigation
  utils.map('v', '<C-e>', '$', opts) -- (V) Move current cursor to the end of line
  utils.map('v', '<C-a>', '0', opts) -- (V) Move current cursor to the beginning of line
  utils.map('i', '<C-e>', '<C-o>$', opts) -- (I) Move current cursor to the end of line
  utils.map('i', '<C-a>', '<C-o>0', opts) -- (I) Move current cursor to the beginning of line
  utils.map('n', '<C-d>', '<C-d>zz', opts) -- (N) Move to next page
  utils.map('n', '<C-u>', '<C-u>zz', opts) -- (N) Move to previous page
  utils.map('n', 'n', 'nzzzv', opts) -- (N) Move to next keyword
  utils.map('n', 'N', 'Nzzzv', opts) -- (N) Move to previous keyword

  -- Move lines around
  utils.map('n', '<S-Up>', ':m-2<CR>', opts) -- (N) Move current line upward
  utils.map('n', '<S-Down>', ':m+<CR>', opts) -- (N) Move current line downward
  utils.map('i', '<S-Up>', '<Esc>:m-2<CR>', opts) -- (N) Move current line upward
  utils.map('i', '<S-Down>', '<Esc>:m+<CR>', opts) -- (N) Move current line downward

  -- Spell Check
  utils.map('n', 'sc', '<cmd>set spell!<CR>') -- Enable spellcheck

  -- Highlight Search
  utils.map('n', '<LEADER><CR>', ':nohlsearch<CR>', opts) -- (N) Clear all highlight

  -- Folding
  utils.map('n', '<C-z>', 'za', opts) -- (N) Fold current function

  -- System Clipboard [Copy/Paste/Cut]
  -- Ref: https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
  utils.map('n', '<LEADER>y', '"+yy', opts)
  utils.map('v', '<LEADER>y', '"+y', opts)
  utils.map('n', '<LEADER>x', '"+d', opts)
  utils.map('v', '<LEADER>x', '"+dd', opts)

  --- Paste *(no delete on register)
  utils.map('n', '<LEADER>p', '"_dP', opts)
  utils.map('v', '<LEADER>p', '"_dP', opts)

  ----------------------------------------------
  -- Explorer
  utils.map('n', '<C-b>', '<cmd>Explore<CR>') -- Open built-in file explorer

  -- Tab
  utils.map('', 'mT', ':tabe<CR>') -- New tab
  utils.map('', '<LEADER>-', ':BufferPrevious<CR>') -- Jump to previous buffer
  utils.map('', '<LEADER>=', ':BufferNext<CR>') -- Jump to the next buffer
  utils.map('', 'gtp', ':BufferPick<CR>') -- Pick a buffer from the current list
  utils.map('', 'gb', '<cmd>Telescope buffers prompt_prefix=🔍<CR>') -- Explore current buffer list

  -- Window
  utils.map('', 's|', ':set splitright<CR>:vsplit<CR>') -- Split window horizontally
  utils.map('', 's-', ':set splitbelow<CR>:split<CR>') -- Split window vertically
  utils.map('n', '<S-Left>', ':vertical resize -2<CR>') -- (N) Resize vertical split window -2 to the right
  utils.map('n', '<S-Right>', ':vertical resize +2<CR>') -- (N) Resize vertical split window +2 to the left
  -- utils.map('n', '<S-Down>', ':horizontal resize -2<CR>') -- (N) Resize horizontal split window +2 to the below
  -- utils.map('n', '<S-Up>', ':horizontal resize +2<CR>') -- (N) Resize horizontal split window -2 to the above
  wk.register({
    w = {
      name = 'Window',
      h = { '<C-w>h', 'FocusLeftWindow' }, -- (N) Move cursor to the left window
      j = { '<C-w>j', 'FocusBelowWindow' }, -- (N) Move cursor to the below window
      k = { '<C-w>k', 'FocusAboveWindow' }, -- (N) Move cursor to the above window
      l = { '<C-w>l', 'FocusRightWindow' }, -- (N) Move cursor to the righ window
    },
  }, {
    prefix = '<Leader>',
  })

  ----------------------------------------------

  -- Terminal
  utils.map('n', '<LEADER>,', ':terminal<CR>') -- (N) Instiatiate a new terminal window

  -- FloatTerm
  utils.map('n', '<C-x>', ":lua require('FTerm').toggle()<CR>", opts) -- (N) toggle Fterm
  utils.map('t', '<C-x>', "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>") -- (T) Close out Fterm

  -- Commentary
  utils.map('n', '<LEADER>/', ':Commentary<CR>') -- (N) Toggle Comment
  utils.map('v', '<LEADER>/', ':Commentary<CR>') -- (V) Toggle Comment

  -- Hop
  utils.map('n', '<CR>', '<CMD>HopWord<CR>') -- (N) Jump to the target line

  -- Harpoon
  utils.map('n', 'mm', ":lua require('harpoon.mark').add_file()<CR>") -- (N) Mark current file in harpoon
  utils.map('n', '<C-p>', ":lua require('harpoon.ui').nav_prev()<CR>") -- (N) Navigate to previous harpoon mark
  utils.map('n', '<C-n>', ":lua require('harpoon.ui').nav_next()<CR>") -- (N) Navigate to next harpoon mark
  utils.map('n', '<LEADER>m', ":lua require('harpoon.ui').toggle_quick_menu()<CR>") -- (N) Open up harpoon menu

  -- Telescope (Short)
  utils.map(
    'n',
    '\\',
    '<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case prompt_prefix=🔍<CR>'
  )
  utils.map('n', '<C-f>', '<cmd>Telescope find_files hidden=true prompt_prefix=🔍<CR>')
  utils.map('n', 'gr', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
  utils.map('n', 'gp', '<cmd>Telescope projects<CR>')
  utils.map('n', 'gP', '<cmd>lua require("telescope").extensions.repo.list{search_dirs = {"~/Workspace"}}<CR>')

  -- SFM (Simple File Manager)
  utils.map('n', '<C-b>', '<cmd>SFMToggle<CR>')

  -- LSP (Short)
  vim.keymap.set('n', '<C-e>', vim.diagnostic.open_float)

  -- Git
  wk.register({
    gd = {
      name = 'GitDiff',
      o = { '<cmd>DiffviewOpen<CR>', 'DiffviewOpen' },
      c = { '<cmd>DiffviewClose<CR>', 'DiffviewClose' },
      f = { '<cmd>DiffviewFileHistory<CR>', 'DiffviewFileHistory' },
    },
    g = {
      b = { '<cmd>GitBlameToggle<CR>', 'GitBlameToggle' },
      g = { '<cmd>LazyGit<CR>', 'LazyGit' },
    },
  }, {
    prefix = '<Leader>',
  })

  -- Overwrite default settings
  wk.register({
    Ss = {
      name = 'Set',
      r = { '<cmd>set relativenumber<CR>', 'Set relativenumber' },
    },
    Su = {
      name = 'Unset',
      r = { '<cmd>set norelativenumber<CR>', 'Unset norelativenumber' },
    },
  }, {
    prefix = '<Leader>',
  })

  -- Markdown toc
  wk.register({
    T = {
      '<cmd>:GenTocGFM<CR>',
      'Set Generate markdown toc',
    },
  }, {
    prefix = '<Leader>',
  })

  -- CodeRunner
  wk.register({
    r = {
      name = 'CodeRunner',
      c = { '<cmd>RunCode<CR>', 'Run based on file type' },
      x = { '<cmd>RunClose<CR>', 'Close runner' },
      f = { '<cmd>RunFile<CR>', 'Run currrent file' },
    },
  }, {
    prefix = '<Leader>',
  })

  -- Barbar
  wk.register({
    b = {
      name = 'Buffer',
      p = { '<cmd>BufferPick<CR>', 'BufferPick' },
      q = { '<cmd>BufferClose<CR>', 'BufferClose' },
      o = { '<cmd>BufferOrderByBufferNumber<CR>', 'BufferOrder ByNumber' },
      O = { '<cmd>BufferCloseAllButCurrent<CR>', 'BufferCloseAll ButCurrent' },
      h = { '<cmd>BufferMovePrevious<CR>', 'BufferMove Previous' },
      l = { '<cmd>BufferMoveNext<CR>', 'BufferMove Next' },
      H = { '<cmd>BufferCloseBuffersLeft<CR>', 'BufferClose Left' },
      L = { '<cmd>BufferCloseBuffersRight<CR>', 'BufferClose Right' },
      P = { '<cmd>BufferPrevious<CR>', 'BufferPrevious' },
      N = { '<cmd>BufferNext<CR>', 'BufferNext' },
    },
    q = { '<cmd>BufferClose<CR>', 'BufferClose' },
  }, {
    prefix = '<Leader>',
  })

  ----------------------------------------------
  -- Telescope
  wk.register({
    f = {
      name = 'Find',
      a = { '<cmd>Telescope builtin prompt_prefix=🔍<CR>', 'Telescope Builtin' },
      b = { '<cmd>Telescope buffers prompt_prefix=🔍<CR>', 'Telescope Buffers' },
      l = { '<cmd>Telescope current_buffer_fuzzy_find prompt_prefix=🔍<CR>', 'Telescope Buffer Search' },
      f = { '<cmd>Telescope find_files hidden=true prompt_prefix=🔍<CR>', 'Telescope Find Files' },
      F = { '<cmd>Telescope oldfiles hidden=true prompt_prefix=🔍<CR>', 'Telescope Find Recent Files' },
      g = { '<cmd>Telescope git_commits prompt_prefix=🔍<CR>', 'Telescope Git Commits' },
      H = { '<cmd>Telescope help_tags prompt_prefix=🔍<CR>', 'Telescope Help' },
      j = { '<cmd>Telescope jumplist prompt_prefix=🔍<CR>', 'Telescope Jump List' },
      k = { '<cmd>Telescope keymaps prompt_prefix=🔍<CR>', 'Telescope Keymaps' },
      e = { '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', 'Telescope File Browser' },
      s = { '<cmd>Telescope live_grep prompt_prefix=🔍<CR>', 'Telescope Live Grep' },
      d = { '<cmd>Telescope diagnostics prompt_prefix=🔍<CR>', 'Telescope Diagonostics' },
      m = { '<cmd>Telescope marks prompt_prefix=🔍<CR>', 'Telescope Marks' },
      p = { '<cmd>Telescope projects prompt_prefix=🔍<CR>', 'Telescope Recent Projects' },
      P = {
        '<cmd>Telescope repo list search_dirs=~/Workspace hidden=true prompt_prefix=🔍<CR>',
        'Telescope Find Projects',
      },
      h = { '<cmd>Telescope highlights prompt_prefix=🔍<CR>', 'Telescope Diagonostics' },
    },
  }, {
    prefix = '<Leader>',
  })

  -- Formatter
  wk.register({
    ff = { '<cmd>Format<CR>', 'Format' },
  }, { prefix = '<Leader>' })
end

----------------------------------------------
-- LSP
function M.lsp_buf_register(bufnr)
  wk.register({
    l = {
      name = 'LSP',
      a = {
        vim.lsp.buf.code_action,
        'LSP Code Actions',
      },
      s = {
        telescope_builtin.lsp_document_symbols,
        'LSP Document Symbols',
      },
      e = {
        vim.diagnostic.open_float,
        'LSP Diagonostic',
      },
    },
  }, {
    prefix = '<Leader>',
    buffer = bufnr,
  })

  -- LSP
  wk.register({
    gd = {
      vim.lsp.buf.definition,
      'LSP Definitions',
    },
    gi = {
      vim.lsp.buf.implementation,
      'LSP Implementations',
    },
    gD = {
      vim.lsp.buf.type_definition,
      'LSP Declaration',
    },
    gR = {
      vim.lsp.buf.references,
      'LSP References',
    },
    gt = {
      vim.lsp.buf.type_definition,
      'LSP Type Definitions',
    },
    K = {
      vim.lsp.buf.hover,
      'LSP Hover',
    },
    ['<C-k>'] = {
      builtin_lsp.peek,
      'Lsp Peek',
    },
  }, {
    buffer = bufnr,
  })
end

return M
