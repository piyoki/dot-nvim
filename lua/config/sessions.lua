local M = {}
local session = require('auto-session')

function M.setup()
  session.setup({
    suppressed_dirs = { '~/', '/', '~/Downloads' },
  })

  -- Set recommended session options
  vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
end

return M
