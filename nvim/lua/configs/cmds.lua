-- Highlight yanked text for 250ms
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("Yank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { timeout = 250, higroup = "Visual" }
  end,
})

-- Remove trailing whitespace on save
vim.g.strip_whitespace = true
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("Whitespace", { clear = true }),
  pattern = "*",
  callback = function()
      vim.cmd([[%s/\s\+$//e]])
  end,
})
