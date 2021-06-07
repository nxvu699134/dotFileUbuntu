local u = require('utils')

--AUTO PAIRs
vim.g.AutoPairsMultilineClose = 0

--VIM MOVE
vim.g.move_key_modifier = 'A'

------------------- INDENT LINE-----------------------------------
vim.cmd('set colorcolumn=99999')
vim.g['indent_blankline_show_current_context'] = true
vim.g['indent_blankline_context_patterns'] = {'class', 'function', 'method', '^if', '^while', '^for', '^object', '^table', 'block', 'arguments', 'element'}
vim.g['indent_blankline_filetype_exclude'] = {'help', 'startify', 'fzf'}

-- Avoid showing message extra message when using completion
u.opt('o', 'shortmess', vim.o.shortmess .. 'c')
u.opt('o', 'signcolumn', 'yes:1')

--Navigate buffer vim
u.map('', '<space>h', '<C-W><C-H>', {silent = true})
u.map('', '<space>j', '<C-W><C-J>', {silent = true})
u.map('', '<space>k', '<C-W><C-K>', {silent = true})
u.map('', '<space>l', '<C-W><C-L>', {silent = true})
u.map('', '<space>ml', '<C-W><C-X>', {silent = true})

u.opt('o', 'lazyredraw', true)

u.opt('o', 'ignorecase', true)

u.opt('o', 'smartcase', true)

u.opt('o', 'showmode', false)

u.opt('o', 'clipboard', 'unnamedplus')

--You will have bad experience for diagnostic messages when it's default 4000.
u.opt('o', 'updatetime', 300)

u.opt('o', 'laststatus', 2)

u.opt('o', 'ttyfast', true)

u.opt('o', 'autoread', true)

u.opt('o', 'hidden', true)

u.opt('o', 'cmdheight', 1)

--Solve vim ESC delay
u.opt('o', 'timeoutlen', 1000)
u.opt('o', 'ttimeoutlen', 0)

u.opt('o', 'autoread', true)

u.opt('w', 'relativenumber', true)

u.opt('b', 'swapfile', false)

local indent = 2
u.opt('b', 'shiftwidth', indent)
u.opt('b', 'tabstop', indent)
u.opt('b', 'softtabstop', indent)
u.opt('b', 'expandtab', true)
u.opt('b', 'autoindent', true)

------------------------------MAP KEYS---------------------------
u.map('n', '<esc>', ':noh<return><esc>', {noremap = true})
u.map('n', '<Space><Space>', ':w<CR>')
u.map('n', 'q', '<Nop>')
