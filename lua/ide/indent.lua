local M = {}

local highlight = {
  'RainbowViolet',
  'RainbowBlue',
  'RainbowLightYellow',
  'RainbowLightBlue',
  'WhiteSpace',
}

local hooks = require('ibl.hooks')
local listchars = require('nvim-listchars')

function M.setup()
  vim.opt.list = true
  listchars.setup({
    save_state = true, -- If enabled, save toggled state in a cache file. Will overwrite current `vim.opt.list` value.
    listchars = {
      trail = '▫',
      eol = '↴',
      tab = '▎ ',
    },
    exclude_filetypes = {}, -- List of filetypes where `listchars` is disabled
    lighten_step = 10, -- Amount to add/remove from base color
  })

  -- create the highlight groups in the highlight setup hook, so they are reset
  -- every time the colorscheme changes
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#ccccff' })
    vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61afef' })
    vim.api.nvim_set_hl(0, 'RainbowLightYellow', { fg = '#dafdba' })
    vim.api.nvim_set_hl(0, 'RainbowLightBlue', { fg = '#dffbfc' })
  end)

  vim.g.rainbow_delimiters = { highlight = highlight }
  require('ibl').setup({
    scope = { highlight = highlight },
    whitespace = {
      remove_blankline_trail = true,
    },
  })

  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M
