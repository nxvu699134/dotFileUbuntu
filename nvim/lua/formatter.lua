local u = require('utils')

u.map('n', '<leader>p', ':Neoformat<CR>', { noremap = false, silent = false });

-- https://github.com/sbdchd/neoformat/issues/134
vim.cmd([[
augroup formatOnSave
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])
