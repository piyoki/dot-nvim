local M = {}
local fterm = require('FTerm')

function M.setup()
  fterm.setup({
    cmd = 'fish',
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  })
end

return M
