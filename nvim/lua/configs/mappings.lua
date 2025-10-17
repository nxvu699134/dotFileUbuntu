local map = vim.api.nvim_set_keymap
map('n', '<esc>', ':noh<return><esc>', {noremap = true})
map('n', '<Space><Space>', ':w<CR>', {})
map('n', 'q', '<Nop>', {})

--Navigate buffer vim
map('', '<space>h', '<C-W><C-H>', {silent = true})
map('', '<space>j', '<C-W><C-J>', {silent = true})
map('', '<space>k', '<C-W><C-K>', {silent = true})
map('', '<space>l', '<C-W><C-L>', {silent = true})

--Move window vim
map('', '<space>wh', [[:lua require('configs.utils').swap_win('h')<CR>]], {silent = true})
map('', '<space>wj', [[:lua require('configs.utils').swap_win('j')<CR>]], {silent = true})
map('', '<space>wk', [[:lua require('configs.utils').swap_win('k')<CR>]], {silent = true})
map('', '<space>wl', [[:lua require('configs.utils').swap_win('l')<CR>]], {silent = true})

-- Make wrap line navigate more EZ
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
