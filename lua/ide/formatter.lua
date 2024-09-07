local M = {}

local formatter = require('formatter')
local util = require('formatter.util')

function M.setup()
  formatter.setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.DEBUG,
    filetype = {
      -- markdown
      markdown = {
        function()
          return {
            exe = 'prettier',
            args = {
              '--stdin-filepath',
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
              '--single-quote false',
            },
            stdin = true,
          }
        end,
      },
      -- json
      json = {
        function()
          return {
            exe = 'prettier',
            args = {
              '--stdin-filepath',
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
              '--single-quote false',
            },
            stdin = true,
          }
        end,
      },
      conf = {
        function()
          return {
            exe = 'prettier',
            args = {
              '--stdin-filepath',
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
              '--single-quote false',
            },
            stdin = true,
          }
        end,
      },
      -- hcl
      hcl = {
        function()
          return {
            exec = 'terragrunt',
            args = { 'hclfmt' },
            stdin = false,
          }
        end,
      },
      -- terraform
      terraform = {
        function()
          return {
            exe = 'terraform',
            args = { 'fmt', '-' },
            stdin = true,
          }
        end,
      },
      -- golang
      go = {
        function()
          return {
            exe = 'gofmt',
            stdin = true,
          }
        end,
      },
      -- lua
      lua = {
        function()
          return {
            exe = 'stylua',
            args = {
              '--search-parent-directories',
              '--stdin-filepath',
              util.escape_path(util.get_current_buffer_file_path()),
              '--',
              '-',
            },
            stdin = true,
          }
        end,
      },
      -- shell
      sh = {
        function()
          return {
            exe = 'shfmt',
            args = { '-i', 2 },
            stdin = true,
          }
        end,
      },
      -- nodejs
      javascript = {
        function()
          return {
            exe = 'prettier',
            args = {
              '--stdin-filepath',
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
              '--single-quote false',
            },
            stdin = true,
          }
        end,
      },
      typescript = {
        function()
          return {
            exe = 'prettier',
            args = {
              '--stdin-filepath',
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
              '--single-quote false',
            },
            stdin = true,
          }
        end,
      },
      -- python
      python = {
        function()
          return {
            exe = 'black',
            args = { '-q', '-' },
            stdin = true,
          }
        end,
      },
      -- ruby
      ruby = {
        function()
          return {
            exe = 'rubocop',
            args = {
              '--fix-layout',
              '--stdin',
              util.escape_path(util.get_current_buffer_file_name()),
              '--format',
              'files',
              '--stderr',
            },
            stdin = true,
          }
        end,
      },
      -- yaml
      yaml = {
        function()
          return {
            exe = 'prettier',
            args = {
              '--stdin-filepath',
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
              '--single-quote false',
            },
            stdin = true,
          }
        end,
      },
      -- nix
      nix = {
        function()
          return {
            exe = 'nixpkgs-fmt',
            args = {},
            stdin = true,
          }
        end,
      },
      -- cmake
      cmake = {
        function()
          return {
            exe = 'cmake-format',
            args = { '-' },
            stdin = true,
          }
        end,
      },
      -- c
      c = {
        require('formatter.filetypes.c').clangformat,
      },
      -- rust
      rust = {
        function()
          return {
            exe = 'rustfmt',
            args = { '--edition 2021' },
            stdin = true,
          }
        end,
      },
      -- Use the special "*" filetype for defining formatter configurations on
      -- any filetype
      ['*'] = {
        -- "formatter.filetypes.any" defines default configurations for any
        -- filetype
        require('formatter.filetypes.any').remove_trailing_whitespace,
      },
    },
  })
end

return M
