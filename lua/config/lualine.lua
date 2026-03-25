local lualine = {}

function lualine.setup()
  -- statusline
  require('lualine').setup({
    options = { theme = 'iceberg_dark' },
    sections = {
      lualine_c = {
        -- Built-in filename component
        {
          'filename',
          file_status = true, -- Shows file status (modified, readonly, etc.)
          path = 1, -- 1 = relative path, 2 = absolute path
          shorting_target = 40,
          symbols = {
            modified = '[+]',
            readonly = '[-]',
            unnamed = '[No Name]',
            newfile = '[New]',
          },
          -- integrate session to lualine
          -- {
          --   function()
          --     return require('auto-session.lib').current_session_name(true)
          --   end,
          -- },
          -- Custom component to display the current working directory
          {
            function()
              return vim.fn.getcwd() -- Uses Neovim's built-in function to get the CWD
            end,
          },
        },
      },
    },
  })
end

return lualine
