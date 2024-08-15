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
  utils.map('n', '<C-d>', 'z+zz', opts) -- (N) Move page down
  utils.map('n', '<C-u>', 'z^zz', opts) -- (N) Move page up
  utils.map('n', 'n', 'nzzzv', opts) -- (N) Move to next keyword
  utils.map('n', 'N', 'Nzzzv', opts) -- (N) Move to previous keyword

  -- Move lines around
  utils.map('n', '<S-Up>', ':m-2<CR>', opts) -- (N) Move current line upward
  utils.map('n', '<S-Down>', ':m+<CR>', opts) -- (N) Move current line downward
  utils.map('i', '<S-Up>', '<Esc>:m-2<CR>', opts) -- (I) Move current line upward
  utils.map('i', '<S-Down>', '<Esc>:m+<CR>', opts) -- (I) Move current line downward

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
  utils.map('n', '<LEADER>t', ':tabe<CR>') -- New tab
  utils.map('n', '<LEADER>-', ':BufferPrevious<CR>') -- Jump to previous buffer
  utils.map('n', '<LEADER>=', ':BufferNext<CR>') -- Jump to the next buffer
  utils.map('n', 'gtp', ':BufferPick<CR>') -- Pick a buffer from the current list
  utils.map('n', 'gb', '<cmd>Telescope buffers prompt_prefix=🔍<CR>') -- Explore current buffer list

  -- Window
  utils.map('n', 's|', ':set splitright<CR>:vsplit<CR>') -- Split window horizontally
  utils.map('n', 's-', ':set splitbelow<CR>:split<CR>') -- Split window vertically
  -- utils.map('n', '<S-Left>', ':vertical resize -2<CR>') -- (N) Resize vertical split window -2 to the right
  -- utils.map('n', '<S-Right>', ':vertical resize +2<CR>') -- (N) Resize vertical split window +2 to the left
  -- utils.map('n', '<S-Down>', ':horizontal resize -2<CR>') -- (N) Resize horizontal split window +2 to the below
  -- utils.map('n', '<S-Up>', ':horizontal resize +2<CR>') -- (N) Resize horizontal split window -2 to the above

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
  utils.map('n', '<M-i>', ":lua require('harpoon.ui').nav_prev()<CR>") -- (N) Navigate to previous harpoon mark
  utils.map('n', '<M-o>', ":lua require('harpoon.ui').nav_next()<CR>") -- (N) Navigate to next harpoon mark
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
  utils.map('n', 'go', '<cmd>Telescope oldfiles hidden=true prompt_prefix=🔍<CR>')

  -- SFM (Simple File Manager)
  utils.map('n', '<C-b>', '<cmd>SFMToggle<CR>')

  -- LSP (Short)
  vim.keymap.set('n', '<C-e>', vim.diagnostic.open_float)

  -- Codeium
  vim.keymap.set('i', '<C-g>', '<cmd>call codeium#Accept()<CR>')
  vim.keymap.set('i', '<C-x>', '<cmd>call codeium#Clear()<CR>')

  -- Git
  wk.add({
    { '<Leader>gdo', '<cmd>DiffviewOpen<CR>', desc = 'DiffviewOpen' },
    { '<Leader>gdc', '<cmd>DiffviewClose<CR>', desc = 'DiffviewClose' },
    { '<Leader>gdf', '<cmd>DiffviewFileHistory<CR>', desc = 'DiffviewFileHistory' },
    { '<Leader>gb', '<cmd>GitBlameToggle<CR>', desc = 'GitBlameToggle' },
    { '<Leader>gg', '<cmd>LazyGit<CR>', desc = 'LazyGit' },
  })

  -- Overwrite default settings
  wk.add({
    { '<Leader>Ss', '<cmd>set relativenumber<CR>', desc = 'Set relativenumber' },
    { '<Leader>Su', '<cmd>set norelativenumber<CR>', desc = 'Unset norelativenumber' },
  })

  -- Markdown toc
  wk.add({
    { '<Leader>T', '<cmd>:GenTocGFM<CR>', desc = 'Set Generate markdown toc' },
  })

  -- CodeRunner
  wk.add({
    { '<Leader>rc', '<cmd>RunCode<CR>', desc = 'Run based on file type' },
    { '<Leader>rx', '<cmd>RunClose<CR>', desc = 'Close runner' },
    { '<Leader>rf', '<cmd>RunFile<CR>', desc = 'Run currrent file' },
  })

  -- Barbar
  wk.add({
    { '<Leader>bp', '<cmd>BufferPick<CR>', desc = 'BufferPick' },
    { '<Leader>bq', '<cmd>BufferClose<CR>', desc = 'BufferClose' },
    { '<Leader>bo', '<cmd>BufferOrderByBufferNumber<CR>', desc = 'BufferOrder ByNumber' },
    { '<Leader>bO', '<cmd>BufferCloseAllButCurrent<CR>', desc = 'BufferCloseAll ButCurrent' },
    { '<Leader>bh', '<cmd>BufferMovePrevious<CR>', desc = 'BufferMove Previous' },
    { '<Leader>bl', '<cmd>BufferMoveNext<CR>', desc = 'BufferMove Next' },
    { '<Leader>bH', '<cmd>BufferCloseBuffersLeft<CR>', desc = 'BufferClose Left' },
    { '<Leader>bL', '<cmd>BufferCloseBuffersRight<CR>', desc = 'BufferClose Right' },
    { '<Leader>bP', '<cmd>BufferPrevious<CR>', desc = 'BufferPrevious' },
    { '<Leader>bN', '<cmd>BufferNext<CR>', desc = 'BufferNext' },
    { '<Leader>bq', '<cmd>BufferClose<CR>', desc = 'BufferClose' },
  })

  ----------------------------------------------
  -- Telescope
  wk.add({
    { '<Leader>fb', '<cmd>Telescope buffers prompt_prefix=🔍<CR>', desc = 'Telescope Buffers' },
    {
      '<Leader>fl',
      '<cmd>Telescope current_buffer_fuzzy_find prompt_prefix=🔍<CR>',
      desc = 'Telescope Buffer Search',
    },
    { '<Leader>ff', '<cmd>Telescope find_files hidden=true prompt_prefix=🔍<CR>', desc = 'Telescope Find Files' },
    {
      '<Leader>fF',
      '<cmd>Telescope oldfiles hidden=true prompt_prefix=🔍<CR>',
      desc = 'Telescope Find Recent Files',
    },
    { '<Leader>fg', '<cmd>Telescope git_commits prompt_prefix=🔍<CR>', desc = 'Telescope Git Commits' },
    { '<Leader>fH', '<cmd>Telescope help_tags prompt_prefix=🔍<CR>', desc = 'Telescope Help' },
    { '<Leader>fj', '<cmd>Telescope jumplist prompt_prefix=🔍<CR>', desc = 'Telescope Jump List' },
    { '<Leader>fk', '<cmd>Telescope keymaps prompt_prefix=🔍<CR>', desc = 'Telescope Keymaps' },
    { '<Leader>fe', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', desc = 'Telescope File Browser' },
    { '<Leader>fs', '<cmd>Telescope live_grep prompt_prefix=🔍<CR>', desc = 'Telescope Live Grep' },
    { '<Leader>fd', '<cmd>Telescope diagnostics prompt_prefix=🔍<CR>', desc = 'Telescope Diagonostics' },
    { '<Leader>fm', '<cmd>Telescope marks prompt_prefix=🔍<CR>', desc = 'Telescope Marks' },
    { '<Leader>fp', '<cmd>Telescope projects prompt_prefix=🔍<CR>', desc = 'Telescope Recent Projects' },
    {
      '<Leader>fP',
      '<cmd>Telescope repo list search_dirs=~/Workspace hidden=true prompt_prefix=🔍<CR>',
      desc = 'Telescope Find Projects',
    },
    { '<Leader>fh', '<cmd>Telescope highlights prompt_prefix=🔍<CR>', desc = 'Telescope Highlights' },
  })

  -- Formatter
  wk.add({
    { '<Leader>F', '<cmd>Format<CR>', desc = 'Format' },
  })

  -- Recent Files
  wk.add({
    { '<Leader>o', '<cmd>Telescope oldfiles hidden=true prompt_prefix=🔍<CR>', desc = 'Telescope Find Recent Files' },
  })

  -- GitHub Copilots
  wk.add({
    {
      '<leader>ccc',
      '<cmd>CopilotChat<CR>',
      desc = 'CopilotChat - OpenChat',
    },
    {
      '<leader>ccq',
      function()
        local input = vim.fn.input('Quick Chat: ')
        if input ~= '' then
          require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
        end
      end,
      desc = 'CopilotChat - QuickChat',
    },
  })
end

----------------------------------------------
-- LSP
function M.lsp_buf_register(bufnr)
  wk.add({
    { '<Leader>la', 'vim.lsp.buf.code_action', desc = 'LSP Code Actions' },
    { '<Leader>ls', 'telescope_builtin.lsp_document_symbols', desc = 'LSP Document Symbols' },
    { '<Leader>le', 'vim.diagnostic.open_float', desc = 'LSP Diagonostic' },
    { '<Leader>lo', '<cmd>LspStart<CR>', desc = 'LSP Start' },
    { '<Leader>lO', '<cmd>LspStop<CR>', desc = 'LSP Stop' },
    { buffer = bufnr },
  })

  -- LSP
  wk.add({
    { '<Leader>gd', 'vim.lsp.buf.definition', desc = 'LSP Definitions' },
    { '<Leader>gi', 'vim.lsp.buf.implementation', desc = 'LSP Implementations' },
    { '<Leader>gD', 'vim.lsp.buf.type_definition', desc = 'LSP Declaration' },
    { '<Leader>gR', 'vim.lsp.buf.references', desc = 'LSP References' },
    { '<Leader>gt', 'vim.lsp.buf.type_definition', desc = 'LSP Type Definitions' },
    { '<Leader>K', 'vim.lsp.buf.hover', desc = 'LSP Hover' },
    { '<C-k>', 'builtin_lsp.peek', desc = 'Lsp Peek' },
    { buffer = bufnr },
  })
end

return M
