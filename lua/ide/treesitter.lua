local M = {}

local nvim_treesitter_configs = require('nvim-treesitter.configs')

function M.setup()
  vim.g.skip_ts_context_commentstring_module = true
  require('ts_context_commentstring').setup({})
  nvim_treesitter_configs.setup({
    ensure_installed = 'all',
    ignore_install = { 'swift', 'phpdoc', 'beancount' },
    autopairs = { enable = true },
    highlight = { enable = true },
    -- indent = { enable = true },
    rainbow = { enable = true, extended_mode = true },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
      },
    },
  })
end

return M
