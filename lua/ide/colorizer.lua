local M = {}

function M.setup()
  require('nvim-highlight-colors').setup({
    enable_tailwind = true,
  })
end

return M
