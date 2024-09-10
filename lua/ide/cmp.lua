local M = {}

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

function M.setup()
  -- add vscode snippets from friendly-snippets to luasnip
  require('luasnip.loaders.from_vscode').lazy_load()

  local cmp_snippet_sources = {
    { name = 'nvim_lsp' }, -- nvim-cmp source for neovim's built-in language server client
    { name = 'nvim_lua' }, -- For neovim lua api
    { name = 'luasnip' }, -- For luasnip users
    { name = 'path' }, -- For path completion
    { name = 'buffer' }, -- For buffer completion
  }

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-d>'] = cmp.mapping.abort(),
      ['<Up>'] = cmp.mapping.select_prev_item(),
      ['<Down>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-Space>'] = cmp.mapping.complete(),
    },
    sources = cmp_snippet_sources,
  })

  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return M
