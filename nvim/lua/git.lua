local u = require('utils')

-----------------------VIM FUGITIVE-----------------------------
vim.cmd('set diffopt+=vertical')
u.map('', '<Leader>gb', ':Git blame<CR>')

-----------------------VIM GITGUTTER-----------------------------
vim.g.gitgutter_sign_priority = 4
