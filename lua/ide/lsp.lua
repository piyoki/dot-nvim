local M = {}

local telescope = require('telescope.builtin')
local lspconfig = require('lspconfig')

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
  lspconfig.ansiblels.setup({})
  lspconfig.bashls.setup({})
  lspconfig.bufls.setup({})
  lspconfig.clangd.setup({})
  lspconfig.cmake.setup({})
  lspconfig.docker_compose_language_service.setup({})
  lspconfig.dockerls.setup({})
  lspconfig.emmet_ls.setup({})
  lspconfig.gopls.setup({})
  lspconfig.graphql.setup({})
  lspconfig.jdtls.setup({})
  lspconfig.jsonls.setup({})
  lspconfig.lua_ls.setup({})
  lspconfig.marksman.setup({})
  lspconfig.nil_ls.setup({})
  lspconfig.pyright.setup({})
  lspconfig.rust_analyzer.setup({})
  lspconfig.sqls.setup({})
  lspconfig.tailwindcss.setup({})
  lspconfig.terraformls.setup({})
  lspconfig.ts_ls.setup({})
  lspconfig.yamlls.setup({})

  -- Not available with native binary
  lspconfig.cssls.setup({})
  lspconfig.cssmodules_ls.setup({})
  lspconfig.html.setup({})

  -- Set up linters via lspconfig
  lspconfig.eslint.setup({})
  lspconfig.golangci_lint_ls.setup({})
  lspconfig.tflint.setup({})
end

function M.setup()
  setup_diagonstic()
  setup_lsp_installer()
  setup_lsp_servers()
  on_attach()
end

return M
