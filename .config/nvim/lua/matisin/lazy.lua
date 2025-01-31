local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "folke/which-key.nvim",
        event = "VeryLazy",              -- Carga el plugin de manera diferida
        config = function()
            require("which-key").setup() -- Configuración básica
        end,
    },
    {
        'VonHeikemen/fine-cmdline.nvim',
        dependencies = {
            { 'MunifTanjim/nui.nvim' }
        }
    },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "nanotee/sqls.nvim" },
    { "norcalli/nvim-colorizer.lua" },
    { "rose-pine/neovim",               name = "rose-pine" },
    "lewis6991/gitsigns.nvim",
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },
    { "direnv/direnv.vim" },

    { "catppuccin/nvim",                 name = "catppuccin", priority = 1000 },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "theprimeagen/harpoon",
    "mbbill/undotree",
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
    },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- LSP Support
    {
        "neovim/nvim-lspconfig",
        -- opts = {
        -- inlay_hints = { enabled = true },
        -- },
    },
    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "saadparwaiz1/cmp_luasnip" },
    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    -- END OF LSP
    "lukas-reineke/indent-blankline.nvim",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    "preservim/nerdcommenter",
    "rhysd/conflict-marker.vim",
    { 'rebelot/kanagawa.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvimtools/none-ls.nvim',                   dependencies = { 'nvim-lua/plenary.nvim' } },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim'
        }
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },
    "ziglang/zig.vim",
    "David-Kunz/gen.nvim",
    "xiyaowong/transparent.nvim"
})
