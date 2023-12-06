local use = require('packer').use

return require('packer').startup(function()
  -- core
  use({ 'wbthomason/packer.nvim' })
  use({ 'nvim-lua/plenary.nvim' })
  use({ 'airblade/vim-rooter' })

  -- colorscheme
  use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use({ 'sam4llis/nvim-tundra' })

  -- interface
  use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } })
  use({ 'kyazdani42/nvim-web-devicons' })
  use({ 'romgrk/barbar.nvim' })
  use({ 'xiyaowong/nvim-cursorword' })

  -- lsp related
  use({ 'folke/lsp-colors.nvim' })
  use({
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
      'b0o/schemastore.nvim',
    },
  })

  -- treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  })

  -- git
  use({ 'f-person/git-blame.nvim' })
  use({ 'lewis6991/gitsigns.nvim' })
  use({ 'kdheepak/lazygit.nvim' })

  -- IDE-like development
  use({ 'onsails/lspkind-nvim' })
  use({ 'hrsh7th/nvim-cmp' })
  use({ 'hrsh7th/cmp-buffer' })
  use({ 'hrsh7th/cmp-path' })
  use({ 'hrsh7th/cmp-nvim-lsp' })
  use({ 'hrsh7th/cmp-nvim-lua' })
  use({ 'hrsh7th/cmp-vsnip' })
  use({ 'hrsh7th/vim-vsnip' })
  use({ 'mattn/emmet-vim' })
  use({ 'rafamadriz/friendly-snippets' })
  use({ 'folke/trouble.nvim' })
  use({ 'tpope/vim-commentary' })
  use({ 'tpope/vim-unimpaired' })
  use({ 'tpope/vim-sleuth' })
  use({ 'tpope/vim-surround' })
  use({ 'lewis6991/impatient.nvim' })
  use({ 'windwp/nvim-autopairs' })
  use({ 'norcalli/nvim-colorizer.lua' })
  use({ 'mhartington/formatter.nvim' })
  use({ 'godlygeek/tabular' })
  use({ 'lukas-reineke/indent-blankline.nvim' })
  use({ 'fraso-dev/nvim-listchars' })
  use({ 'CRAG666/code_runner.nvim' })
  use({ 'kshenoy/vim-signature' })

  -- tools
  use({ 'phaazon/hop.nvim' })
  use({ 'ThePrimeagen/harpoon' })
  use({ 'numtostr/FTerm.nvim' })
  use({ 'folke/which-key.nvim' })
  use({ 'wakatime/vim-wakatime' })
  use({
    'dinhhuy258/sfm.nvim',
    requires = {
      'dinhhuy258/sfm-git.nvim',
      'dinhhuy258/sfm-fs.nvim',
      'dinhhuy258/sfm-telescope.nvim',
    },
  })
  use({ 'ahmedkhalf/project.nvim' })
  use({ 'startup-nvim/startup.nvim' })

  -- searching & filtering
  use({ 'nvim-telescope/telescope.nvim' })
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use({ 'nvim-telescope/telescope-file-browser.nvim' })
  use({ 'nvim-telescope/telescope-live-grep-args.nvim' })
  use({ 'cljoly/telescope-repo.nvim' })
  use({ 'haya14busa/incsearch.vim' })

  -- markdown support
  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  })
  use({ 'mzlogin/vim-markdown-toc' })
end)
