local M = {}

local telescope = require('telescope.builtin')
local lsp = vim.lsp

local setup_diagnostic = function()
  vim.diagnostic.config({
    update_in_insert = true,
    severity_sort = true,
    virtual_text = { source = 'always' },
    float = { source = 'always' },
  })
end

local mason_ensure_installed = {
  'ansiblels',
  'bashls',
  'buf_ls',
  'clangd',
  'cmake',
  'docker_compose_language_service',
  'dockerls',
  'emmet',
  'gopls',
  'graphql',
  'jdtls',
  'jsonls',
  'marksman',
  'pyright',
  'sqls',
  'tailwindcss',
  'terraformls',
  'ts_ls',
  'yamlls',
  'eslint',
  'golangci_lint_ls',
  'tflint',
  'cssls',
  'cssmodules_ls',
  'html',

  -- only valid in NixOS
  -- 'nil_ls',
}

local setup_lsp_installer = function()
  require('mason').setup()
  require('mason-lspconfig').setup({
    -- Installed manually on system (Nix)
    -- Check with :LspLog to see if it causes any issues by NixOS, if so, install lsp, linter, formatter via Nix
    ensure_installed = mason_ensure_installed,
    automatic_enable = true,
  })
end

local setup_lsp_servers = function()
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local opts = { buffer = args.buf }
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
      -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
      vim.keymap.set('n', '<C-e>', vim.diagnostic.open_float, opts)
    end,
  })

  -- Set up lsp servers via lspconfig
  lsp.enable(mason_ensure_installed)

  lsp.config('rust_analyzer', {
    settings = {
      ['rust-analyzer'] = {},
    },
  })

  lsp.config('lua_ls', {
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
  setup_diagnostic()
  setup_lsp_installer()
  setup_lsp_servers()
end

return M
