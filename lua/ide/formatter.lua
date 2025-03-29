local M = {}

local formatter = require('formatter')
local util = require('formatter.util')

-- universal formatter
-- local prettier = { require('formatter.filetypes.lua').stylua }
local prettier = {
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
}

function M.setup()
  formatter.setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    filetype = {
      -- yaml filetype
      yaml = prettier,
      -- markdown filetype
      markdown = prettier,
      -- json filetype
      json = prettier,
      -- conf filetype
      conf = prettier,
      -- nodejs filetype
      javascript = prettier,
      javascriptreact = prettier,
      typescript = prettier,
      typescriptreact = prettier,
      -- hcl filetype
      hcl = {
        function()
          return {
            exec = 'terragrunt',
            args = { 'hclfmt' },
            stdin = false,
          }
        end,
      },
      -- terraform filetype
      terraform = {
        function()
          return {
            exe = 'terraform',
            args = { 'fmt', '-' },
            stdin = true,
          }
        end,
      },
      -- golang filetype
      go = {
        function()
          return {
            exe = 'gofmt',
            stdin = true,
          }
        end,
      },
      -- lua filetype
      lua = { require('formatter.filetypes.lua').stylua },
      -- shell filetype
      sh = {
        function()
          return {
            exe = 'shfmt',
            args = { '-i', 2 },
            stdin = true,
          }
        end,
      },
      -- python filetype
      python = {
        function()
          return {
            exe = 'black',
            args = { '-q', '-' },
            stdin = true,
          }
        end,
      },
      -- ruby filetype
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
      -- nix filetype
      nix = {
        function()
          return {
            exe = 'nixpkgs-fmt',
            args = {},
            stdin = true,
          }
        end,
      },
      -- cmake filetype
      cmake = {
        function()
          return {
            exe = 'cmake-format',
            args = { '-' },
            stdin = true,
          }
        end,
      },
      -- c filetype
      c = {
        require('formatter.filetypes.c').clangformat,
      },
      -- rust filetype
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
