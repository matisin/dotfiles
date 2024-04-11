vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>]])
vim.keymap.set("n", "<leader>F", "<cmd>:!eslint % --fix<CR>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>")
-- vim.keymap.set("t", "<ESC>k", "<C-\\><C-n><C-w>k")
-- vim.keymap.set("n", "<leader>tt", ":belowright 20split<Bar>:term<CR>")
-- vim.keymap.set("n", "<leader>tv", ":vsplit<Bar>:term<CR>")

-- vim.keymap.set('n', '<leader>pv', ':Ex<CR>')

vim.keymap.set('n', '<leader>tc', ':lua vim.cmd("silent !tmux-toggle-scheme"); GetTheme()<CR>')
vim.keymap.set('n', '<leader>tp', "<cmd>silent !tmux-toggle-pizza<CR>")
vim.keymap.set('n', '<leader>tg', ':lua GetTheme()<CR>')

vim.keymap.set('n', "<C-l>", "<cmd>bnext<CR>")
vim.keymap.set('n', "<C-h>", "<cmd>bprevious<CR>")
vim.cmd("autocmd BufReadPre *.js nnoremap <buffer> [[ []%0")
vim.cmd("autocmd BufReadPre *.js nnoremap <buffer> ]] ][%0")
