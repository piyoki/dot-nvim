local M = {}

function M.setup()
  vim.g.gitblame_date_format = '%r'

  -- load git-worktree plugin
  require('git-worktree').setup({})
end

return M
