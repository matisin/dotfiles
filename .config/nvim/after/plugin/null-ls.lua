local null_ls = require("null-ls")
local sources = {
    null_ls.builtins.formatting.djlint.with({
        extra_args = { "--quiet" },
        filetypes = { "handlebars" }
    }),
    null_ls.builtins.formatting.alejandra.with({
        -- Aquí puedes añadir opciones específicas para alejandra si las necesitas
    })
}
null_ls.setup({ sources = sources })

