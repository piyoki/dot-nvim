local M = {}
local autopairs = require('nvim-autopairs')

function M.setup()
  autopairs.setup({
    check_ts = true,
    disable_filetype = { 'TelescopePrompt' },
  })
end

return M
