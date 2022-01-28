-- Auto remove trailing spaces
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e ]])

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. 'c'

-- for better completion
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.pumheight = 10 -- limit completion items

vim.opt.signcolumn = 'yes:1'
vim.opt.lazyredraw = true
vim.opt.splitright = false
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.laststatus = 2
vim.opt.ttyfast = true
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 2 -- n rows at edge then scroll
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.writebackup = false

--You will have bad experience for diagnostic messages when it's default 4000.
vim.opt.updatetime = 250

--Solve vim ESC delay
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

local indent = 2
vim.o.shiftwidth = indent
vim.o.tabstop = indent
vim.o.softtabstop = indent
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true

------------------------------MAP KEYS---------------------------
vim.api.nvim_set_keymap('n', '<esc>', ':noh<return><esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Space><Space>', ':w<CR>', {})
vim.api.nvim_set_keymap('n', 'q', '<Nop>', {})

--Navigate buffer vim
vim.api.nvim_set_keymap('', '<space>h', '<C-W><C-H>', {silent = true})
vim.api.nvim_set_keymap('', '<space>j', '<C-W><C-J>', {silent = true})
vim.api.nvim_set_keymap('', '<space>k', '<C-W><C-K>', {silent = true})
vim.api.nvim_set_keymap('', '<space>l', '<C-W><C-L>', {silent = true})

--Move window vim
vim.api.nvim_set_keymap('', '<space>wh', [[:lua require('utils').swap_win('h')<CR>]], {silent = true})
vim.api.nvim_set_keymap('', '<space>wj', [[:lua require('utils').swap_win('j')<CR>]], {silent = true})
vim.api.nvim_set_keymap('', '<space>wk', [[:lua require('utils').swap_win('k')<CR>]], {silent = true})
vim.api.nvim_set_keymap('', '<space>wl', [[:lua require('utils').swap_win('l')<CR>]], {silent = true})

-- Make wrap line navigate more EZ
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
