local M = {}
local session = require('auto-session')

function M.setup()
  session.setup({
    suppressed_dirs = { '~/', '/', '~/Downloads' },
    pre_save_cmds = { 'Neotree close' },
  })

  -- set recommended session options
  vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
end

return M
