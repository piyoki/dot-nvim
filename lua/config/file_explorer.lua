local M = {}
local actions = require('lir.actions')
local mark_actions = require('lir.mark.actions')
local clipboard_actions = require('lir.clipboard.actions')
local lir = require('lir')

function M.setup()
  lir.setup({
    show_hidden_files = true,
    ignore = {
      'DS_Store',
    },
    devicons = {
      enable = true,
      highlight_dirname = true,
    },
    mappings = {
      ['<CR>'] = actions.edit,
      ['e'] = actions.edit,
      ['<C-s>'] = actions.split,
      ['<C-v>'] = actions.vsplit,
      ['<C-t>'] = actions.tabedit,

      ['h'] = actions.up,
      ['l'] = actions.edit,
      ['q'] = actions.quit,

      ['K'] = actions.mkdir,
      ['N'] = actions.newfile,
      ['R'] = actions.rename,
      ['@'] = actions.cd,
      ['Y'] = actions.yank_path,
      ['.'] = actions.toggle_show_hidden,
      ['D'] = actions.delete,

      -- select the current item
      ['J'] = function()
        mark_actions.toggle_mark()
        vim.cmd('normal! jk')
      end,
      ['y'] = clipboard_actions.copy,
      ['x'] = clipboard_actions.cut,
      ['p'] = clipboard_actions.paste,
    },
    float = {
      winblend = 1,
      curdir_window = {
        enable = true,
        highlight_dirname = true,
      },

      -- -- You can define a function that returns a table to be passed as the third
      -- -- argument of nvim_open_win().
      -- win_opts = function()
      --   local width = math.floor(vim.o.columns * 0.8)
      --   local height = math.floor(vim.o.lines * 0.8)
      --   return {
      --     border = {
      --       "+", "─", "+", "│", "+", "─", "+", "│",
      --     },
      --     width = width,
      --     height = height,
      --     row = 1,
      --     col = math.floor((vim.o.columns - width) / 2),
      --   }
      -- end,
    },
    hide_cursor = false,

    vim.api.nvim_create_autocmd({ 'FileType' }, {
      pattern = { 'lir' },
      callback = function()
        -- use visual mode
        vim.api.nvim_buf_set_keymap(
          0,
          'x',
          'J',
          ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
          { noremap = true, silent = true }
        )

        -- echo cwd
        vim.api.nvim_echo({ { vim.fn.expand('%:p'), 'Normal' } }, false, {})
      end,
    }),
  })
end

return M
