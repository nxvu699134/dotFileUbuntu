
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
local function prettier()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
    stdin = true
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = { prettier },
    typescript = { prettier },
    html = { prettier },
    scss = { prettier },
  }
})

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.html,*.scss FormatWrite
  autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END
]])

-- vim.cmd([[
-- let g:prettier#autoformat = 0
-- let g:prettier#autoformat_require_pragma = 0
-- ]])
