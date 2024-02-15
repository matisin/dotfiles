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
    "lewis6991/gitsigns.nvim",
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },
    {
        "catppuccin/nvim",
        as = "catppuccin"
    },
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    "theprimeagen/harpoon",
    "mbbill/undotree",
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
    },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- LSP Support
    { "neovim/nvim-lspconfig" },
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
    "junegunn/goyo.vim",
    "lukas-reineke/indent-blankline.nvim",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "matisin/dashboard-nvim",
        as = "dashboard",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    "preservim/nerdcommenter",
    "tpope/vim-fugitive",
    "rhysd/conflict-marker.vim",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",        -- Optional image support in preview window: See `# Preview Mode` for more information
        },
    }

    -- { "shortcuts/no-neck-pain.nvim",     version = "*" }
})
