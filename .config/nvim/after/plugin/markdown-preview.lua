vim.keymap.set("n", "<leader>m", vim.cmd.MarkdownPreviewToggle, { desc = "Toggle Markdown Preview" })

function ColorMarkdown(color)
    color = color or "dark"

    vim.g.mkdp_teme = color
end
