local null_ls = require("null-ls")
local sources = {
    null_ls.builtins.formatting.djlint.with({
        extra_args = { "--quiet" },
        filetypes = { "handlebars" }
    }),
    null_ls.builtins.formatting.alejandra.with({
    }),
    null_ls.builtins.formatting.terraform_fmt.with({})
}
null_ls.setup({ sources = sources })

