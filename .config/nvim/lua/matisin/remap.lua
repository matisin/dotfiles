vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines, preserve cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page Up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search match, center screen, and open folds" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search match, center screen, and open folds" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection without yanking" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank entire line to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode (Q)" })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Toggle Tmux Sessionizer" })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format file using LSP" })
vim.keymap.set("v", "<leader>f", vim.lsp.buf.format, { desc = "Format selection using LSP" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item and center screen" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item and center screen" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item and center screen" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item and center screen" })

vim.keymap.set("n", "<leader>s", [[:%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>]],
    { desc = "Replace word under cursor globally" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

vim.keymap.set('n', '<leader>pv', ':Ex<CR>', { desc = "Open file explorer (Netrw)" })

-- vim.keymap.set('n', '<C-l>', '<cmd>bnext<CR>', { desc = "Next buffer" })
-- vim.keymap.set('n', '<C-h>', '<cmd>bprevious<CR>', { desc = "Previous buffer" })

vim.cmd("autocmd BufReadPre *.js nnoremap <buffer> [[ []%0")
vim.cmd("autocmd BufReadPre *.js nnoremap <buffer> ]] ][%0")

vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])
