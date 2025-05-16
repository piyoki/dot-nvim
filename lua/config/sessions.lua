local M = {}
local session = require('auto-session')
local lualine = require('lualine')

function M.setup()
  session.setup({
    suppressed_dirs = { '~/', '/', '~/Downloads' },
  })

  -- set recommended session options
  vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

  -- integrate session to lualine
  lualine.setup({
    sections = {
      lualine_c = {
        function()
          return require('auto-session.lib').current_session_name(true)
        end,
      },
    },
  })
end

return M
