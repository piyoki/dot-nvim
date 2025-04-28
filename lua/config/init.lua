local M = {}

function M.setup()
  require('config.tools').setup()
  require('config.interface').setup()
  require('config.telescope').setup()
  require('config.file_explorer').setup()
end

return M
