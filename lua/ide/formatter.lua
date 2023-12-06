local M = {}

local formatter = require('formatter')
local util = require('formatter.util')

function M.setup()
  formatter.setup({
    filetype = {
      -- markdown formatter
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
      -- json formatter
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
      -- hcl formatter
      hcl = {
        function()
          return {
            exec = 'terragrunt',
            args = { 'hclfmt' },
            stdin = false,
          }
        end,
      },
      -- terraform formatter
      terraform = {
        function()
          return {
            exe = 'terraform',
            args = { 'fmt', '-' },
            stdin = true,
          }
        end,
      },
      -- golang formatter
      go = {
        function()
          return {
            exe = 'gofmt',
            stdin = true,
          }
        end,
      },
      -- lua formatter
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
      -- shell script formatter
      sh = {
        function()
          return {
            exe = 'shfmt',
            args = { '-i', 2 },
            stdin = true,
          }
        end,
      },
      -- nodejs formatter
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
      -- python formatter
      python = {
        function()
          return {
            exe = 'black',
            args = { '-q', '-' },
            stdin = true,
          }
        end,
      },
      -- ruby formatter
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
    },
  })
end

return M
