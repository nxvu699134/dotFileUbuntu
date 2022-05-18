
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
    args = {
      '--config-precedence',
      'prefer-file',
      "--stdin-filepath",
      vim.api.nvim_buf_get_name(0)
    },
    stdin = true
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = { prettier },
    typescript = { prettier },
    typescriptreact = { prettier },
    javascriptreact = { prettier },
    html = { prettier },
    scss = { prettier },
    css = { prettier },
  }
})

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.html,*.scss,*css FormatWrite
  autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
  autocmd BufWritePre *.c,*.cpp,*.h*.hpp lua vim.lsp.buf.formatting_sync(nil, 1000)
  autocmd BufWritePre *.svelte lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END
]])
