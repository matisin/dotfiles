-- local lsp = require('markdown-preview')

vim.keymap.set("n", "<leader>m", vim.cmd.MarkdownPreviewToggle)

-- vim.g.mkdp_auto_start= 1

function ColorMarkdown(color)
    color = color or "dark"

    vim.g.mkdp_teme = color
end
