local M = {}

local telescope = require('telescope.builtin')
local lspconfig = vim.lsp.config
local lspenable = vim.lsp.enable

local on_attach = function(_, _)
  vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {})
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
  vim.keymap.set('n', 'gr', telescope.lsp_references, {})
  vim.keymap.set('n', '<C-e>', vim.diagnostic.open_float)
end

local setup_diagonstic = function()
  vim.diagnostic.config({
    update_in_insert = true,
    severity_sort = true,
    virtual_text = { source = 'always' },
    float = { source = 'always' },
  })
end

local setup_lsp_installer = function()
  require('mason').setup()
  require('mason-lspconfig').setup({
    -- Installed manually on system (Nix)
    -- Check with :LspLog to see if it causes any issues by NixOS, if so, install lsp, linter, formatter via Nix
    ensure_installed = {},
    automatic_installation = false,
  })
end

local setup_lsp_servers = function()
  -- Set up lsp servers via lspconfig
  lspenable('ansiblels')
  lspenable('bashls')
  lspenable('buf_ls')
  lspenable('clangd')
  lspenable('cmake')
  lspenable('docker_compose_language_service')
  lspenable('dockerls')
  lspenable('emmet')
  lspenable('gopls')
  lspenable('graphql')
  lspenable('jdtls')
  lspenable('jsonls')
  lspenable('marksman')
  lspenable('nixd')
  lspenable('pyright')
  lspenable('sqls')
  lspenable('tailwindcss')
  lspenable('terraformls')
  lspenable('ts_ls')
  lspenable('yamlls')
  lspenable('eslint')
  lspenable('golangci_lint_ls')
  lspenable('tflint')

  lspconfig('rust_analyzer', {
    settings = {
      ['rust-analyzer'] = {},
    },
  })

  lspconfig('lua_ls', {
    settings = {
      ['Lua'] = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  })

  -- Not available with native binary
  -- lspconfig.cssls.setup({ capabilities = capabilities })
  -- lspconfig.cssmodules_ls.setup({ capabilities = capabilities })
  -- lspconfig.html.setup({ capabilities = capabilities })
end

function M.setup()
  setup_diagonstic()
  setup_lsp_installer()
  setup_lsp_servers()
  on_attach()
end

return M
