vim.g.goyo_width = 100
vim.g.goyo_height = '100%'
vim.g.goyo_linenr = 1

vim.keymap.set('n', '<leader>gg', [[:Goyo <CR>]])
vim.keymap.set('n', '<leader>G', [[:Goyo! <CR>]])

function goyo_enter()
  -- vim.o.showmode = false
  -- vim.o.showcmd = false
  -- vim.o.scrolloff = 999
  vim.cmd('IBLEnable')
end

function goyo_leave()
  -- vim.o.showmode = true
  -- vim.o.showcmd = true
  -- vim.o.scrolloff = 5
  vim.cmd('IBLEnable')
end

vim.cmd('autocmd! User GoyoEnter nested lua goyo_enter()')
vim.cmd('autocmd! User GoyoLeave nested lua goyo_leave()')
-- vim.cmd('autocmd! User GoyoEnter IBLEnable')
-- vim.cmd('autocmd! User GoyoLeave IBLEnable')
