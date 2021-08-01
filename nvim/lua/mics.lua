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
vim.opt.updatetime = 600

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

------------------------------MAP KEYS---------------------------
vim.api.nvim_set_keymap('n', '<esc>', ':noh<return><esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Space><Space>', ':w<CR>', {})
vim.api.nvim_set_keymap('n', 'q', '<Nop>', {})

--Navigate buffer vim
vim.api.nvim_set_keymap('', '<space>h', '<C-W><C-H>', {silent = true})
vim.api.nvim_set_keymap('', '<space>j', '<C-W><C-J>', {silent = true})
vim.api.nvim_set_keymap('', '<space>k', '<C-W><C-K>', {silent = true})
vim.api.nvim_set_keymap('', '<space>l', '<C-W><C-L>', {silent = true})
vim.api.nvim_set_keymap('', '<space>ml', '<C-W><C-X>', {silent = true})
