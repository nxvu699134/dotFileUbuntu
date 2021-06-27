local u = require('utils')

-- u.map('n', '<leader>p', ':Neoformat<CR>', { noremap = false, silent = false });
--
-- -- https://github.com/sbdchd/neoformat/issues/134 Give up since this issue
-- vim.cmd([[
-- augroup formatOnSave
--   autocmd!
--   autocmd BufWritePre * undojoin | Neoformat
-- augroup END
-- ]])


-- u.map('n', '<leader>p', ':Prettier<CR>', { noremap = false, silent = false });

vim.cmd([[
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0
]])
