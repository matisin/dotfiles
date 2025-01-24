local lsp = require('lsp-zero')
local lsp_config = require('lspconfig')

lsp.preset('recomended')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>',
            { buffer = event.buf, desc = "Show hover information for the symbol under the cursor" })
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>',
            { buffer = event.buf, desc = "Go to the definition of the symbol" })
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>',
            { buffer = event.buf, desc = "Go to the declaration of the symbol" })
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
            { buffer = event.buf, desc = "Go to the implementation of the symbol" })
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
            { buffer = event.buf, desc = "Go to the type definition of the symbol" })
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>',
            { buffer = event.buf, desc = "Show references of the symbol" })
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
            { buffer = event.buf, desc = "Show signature help for the symbol" })
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>',
            { buffer = event.buf, desc = "Rename the symbol under the cursor" })
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
            { buffer = event.buf, desc = "Format the file or selection" })
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>',
            { buffer = event.buf, desc = "Show available code actions" })

        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>',
            { buffer = event.buf, desc = "Show diagnostic in a floating window" })
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>',
            { buffer = event.buf, desc = "Go to the previous diagnostic" })
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>',
            { buffer = event.buf, desc = "Go to the next diagnostic" })
    end
})

lsp_config.lua_ls.setup {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

lsp_config.gopls.setup {
    settings = {
        gopls = {
            buildFlags = { "-tags=remote,!remote,testing" }
        }
    }
}

lsp_config.marksman.setup {}
lsp_config.svelte.setup {}
lsp_config.ts_ls.setup {}
lsp_config.nixd.setup {}
lsp_config.jdtls.setup {}
lsp_config.jsonls.setup {}
lsp_config.cssls.setup {}
lsp_config.terraform_lsp.setup {}
lsp_config.glsl_analyzer.setup {}
lsp_config.zls.setup {}
lsp_config.bashls.setup {}

lsp.setup()
