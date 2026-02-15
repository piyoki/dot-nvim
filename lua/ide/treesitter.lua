local M = {}

function M.setup()
  local ok_treesitter, nvim_treesitter_configs = pcall(require, 'nvim-treesitter.configs')
  if not ok_treesitter then
    vim.notify('nvim-treesitter is not available', vim.log.levels.WARN)
    return
  end

  local ok_commentstring, commentstring = pcall(require, 'ts_context_commentstring')
  if ok_commentstring then
    vim.g.skip_ts_context_commentstring_module = true
    commentstring.setup({})
  end

  nvim_treesitter_configs.setup({
    -- ref: https://github.com/nvim-treesitter/nvim-treesitter
    ensure_installed = {
      'angular',
      'bash',
      'c',
      'cpp',
      'cmake',
      'caddy',
      'comment',
      'css',
      'csv',
      'dockerfile',
      'editorconfig',
      'fish',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'goctl',
      'gomod',
      'gosum',
      'groovy',
      'haskell',
      'haskell_persistent',
      'hcl',
      'helm',
      'hjson',
      'html',
      'htmldjango',
      'hyprlang',
      'java',
      'javadoc',
      'javascript',
      'jq',
      'jsdoc',
      'json',
      'jsonc',
      'jsonnet',
      'just',
      'kcl',
      'kconfig',
      'latex',
      'llvm',
      'lua',
      'luadoc',
      'luap',
      'markdown',
      'markdown_inline',
      'meson',
      'nginx',
      'nix',
      'nu',
      'properties',
      'proto',
      'python',
      'r',
      'regex',
      'rego',
      'requirements',
      'ruby',
      'rust',
      'scss',
      'sql',
      'ssh_config',
      'terraform',
      'tmux',
      'toml',
      'tsx',
      'typescript',
      'typespec',
      'vim',
      'vimdoc',
      'vue',
      'query',
      'xml',
      'xresources',
      'yaml',
    },
    -- ensure_installed = 'all',
    -- ignore_install = { 'swift', 'phpdoc', 'beancount' },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
      },
    },
  })
end

return M
