local M = {}

function M.setup()
  local neotree = require('neo-tree')
  neotree.setup({
    filesystem = {
      hijack_netrw_behavior = 'disabled',
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          'node_modules',
          '.DS_Store',
        },
      },
    },
  })
end

return M
