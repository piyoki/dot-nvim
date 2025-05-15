local M = {}

function M.setup()
  -- hop
  require('hop').setup()

  -- autopairs
  require('nvim-autopairs').setup({
    check_ts = true,
    disable_filetype = { 'TelescopePrompt' },
  })

  -- emmet
  vim.g.user_emmet_leader_key = '<C-z>'

  -- incsearch
  vim.g['incsearch#auto_nohlsearch'] = 1
end

return M
