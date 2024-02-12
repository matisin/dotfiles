-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use('lewis6991/gitsigns.nvim')
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- themes
  use { "catppuccin/nvim", as = "catppuccin" }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' }
    }
  }

  use('junegunn/goyo.vim')
  use('lukas-reineke/indent-blankline.nvim')

  -- use {
    -- 'nvim-neo-tree/neo-tree.nvim',
    -- branch = 'v3.x',
    -- requires = {
      -- 'nvim-lua/plenary.nvim',
      -- 'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      -- 'MunifTanjim/nui.nvim',
      -- '3rd/image.nvim',              -- Optional image support in preview window: See `# Preview Mode` for more information
    -- }
  -- }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'matisin/dashboard-nvim', as = 'dashboard',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use('preservim/nerdcommenter')
  use('tpope/vim-fugitive')
  use('rhysd/conflict-marker.vim')
end)
