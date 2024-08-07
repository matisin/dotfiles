local lsp = require('lsp-zero')
local lsp_config = require('lspconfig')
-- local mason = require('mason')
-- local mason_lsp = require('mason-lspconfig')
local null_ls = require("null-ls")
-- mason.setup({})
-- mason_lsp.setup({
-- ensure_installed = {
-- 'tsserver',
-- 'eslint',
-- 'sqlls'
-- },
-- handlers = {
-- lsp.default_setup,
-- },
-- })
lsp.preset('recomended')
local sources = {
    null_ls.builtins.formatting.djlint.with({
        extra_args = { "--quiet" },
        filetypes = { "handlebars" }
    }),

}

null_ls.setup({ sources = sources })

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    end
})

lsp_config.sqls.setup {
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr) -- require sqls.nvim
    end,
    settings = {
        sqls = {
            connections = {
                {
                    alias = 'utils',
                    driver = 'postgresql',
                    dataSourceName = 'host=127.0.0.1 port=5432 user=username password=password dbname=utils sslmode=disable',
                },
                {
                    alias = 'users',
                    driver = 'postgresql',
                    dataSourceName = 'host=127.0.0.1 port=5432 user=username password=password dbname=users sslmode=disable',
                },
                {
                    alias = 'professionals',
                    driver = 'postgresql',
                    dataSourceName = 'host=127.0.0.1 port=5432 user=username password=password dbname=professionals sslmode=disable',
                },
                {
                    alias = 'companies',
                    driver = 'postgresql',
                    dataSourceName = 'host=127.0.0.1 port=5432 user=username password=password dbname=companies sslmode=disable',
                },
            },
        },
    },
}

lsp_config.tsserver.setup {}

lsp_config.lua_ls.setup {
    settings = {
        lua = {
            runtime = {
                -- tell the language server which version of lua you're using
                -- (most likely luajit in the case of neovim)
                version = 'luajit',
            },
            diagnostics = {
                -- get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- make the server aware of neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
lsp_config.gopls.setup {}
-- lsp_config.yamlls.setup({
-- on_attach = function(client)
-- if client.resolved_capabilities.document_formatting then
-- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)")
-- end
-- end,
-- settings = {
-- yaml = {
-- format = {
-- enable = true,
-- prettier = true
-- }
-- }
-- }
-- })
lsp.setup()
