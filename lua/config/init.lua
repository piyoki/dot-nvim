local M = {}

function M.setup()
  require('config.tools').setup()
  require('config.filetype').setup()
  require('config.fterm').setup()
  require('config.markdown-preview').setup()
  require('config.autopairs').setup()
  require('config.interface').setup()
  require('config.telescope').setup()
  require('config.file_explorer').setup()
  require('config.sessions').setup()
end

return M
