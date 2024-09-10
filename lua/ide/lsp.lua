local M = {}

local telescope = require('telescope.builtin')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
  lspconfig.ansiblels.setup({ capabilities = capabilities })
  lspconfig.bashls.setup({ capabilities = capabilities })
  lspconfig.bufls.setup({ capabilities = capabilities })
  lspconfig.clangd.setup({ capabilities = capabilities })
  lspconfig.cmake.setup({ capabilities = capabilities })
  lspconfig.docker_compose_language_service.setup({})
  lspconfig.dockerls.setup({ capabilities = capabilities })
  lspconfig.emmet_ls.setup({ capabilities = capabilities })
  lspconfig.gopls.setup({ capabilities = capabilities })
  lspconfig.graphql.setup({ capabilities = capabilities })
  lspconfig.jdtls.setup({ capabilities = capabilities })
  lspconfig.jsonls.setup({ capabilities = capabilities })
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  })
  lspconfig.marksman.setup({ capabilities = capabilities })
  lspconfig.nil_ls.setup({ capabilities = capabilities })
  lspconfig.pyright.setup({ capabilities = capabilities })
  lspconfig.rust_analyzer.setup({ capabilities = capabilities })
  lspconfig.sqls.setup({ capabilities = capabilities })
  lspconfig.tailwindcss.setup({ capabilities = capabilities })
  lspconfig.terraformls.setup({ capabilities = capabilities })
  lspconfig.ts_ls.setup({ capabilities = capabilities })
  lspconfig.yamlls.setup({ capabilities = capabilities })

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
