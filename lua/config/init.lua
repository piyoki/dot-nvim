local M = {}

function M.setup()
  require('config.tools').setup()
  require('config.interface').setup()
  require('config.telescope').setup()
end

return M
