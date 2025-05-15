local M = {}
local filetype = require('plenary.filetype')

function M.setup()
  filetype.add_file('json')
  filetype.add_file('nginx')
end

return M
