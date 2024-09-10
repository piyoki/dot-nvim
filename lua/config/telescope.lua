local M = {}

local telescope = require('telescope')

function M.setup()
  require('telescope').setup({
    extensions = {
      repo = {
        settings = {
          auto_lcd = true,
        },
      },
    },
  })

  telescope.setup({
    defaults = {
      defaults = require('telescope.themes').get_ivy(),
      file_ignore_patterns = { 'node_modules/', '.git/' },
    },
    pickers = {
      find_files = {
        find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
        hidden = true,
      },
      file_browser = {
        theme = 'ivy',
        hijack_netrw = true,
        hidden = true,
      },
    },
  })
  telescope.setup({
    extensions = {
      ['ui-select'] = { require('telescope.themes').get_dropdown({}) },
    },
  })
  telescope.load_extension('ui-select')
  telescope.load_extension('fzf')
  telescope.load_extension('file_browser')
  telescope.load_extension('harpoon')
  telescope.load_extension('live_grep_args')
  telescope.load_extension('sfm-telescope')
  telescope.load_extension('projects')
  telescope.load_extension('repo')
end

return M
