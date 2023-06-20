require("lspsaga").setup({
  code_action = {
    keys = {
      quit = "<esc>",
      exec = "<CR>",
    },
  },
  lightbulb = {
    enable = false,
  },
  symbol_in_winbar = {
    enable = false,
    separator = "  ",
  },
 ui = {
    winblend = 0,
    expand = "",
    collapse = "",
    preview = " ",
    code_action = "💡 ",
    diagnostic = "🐞 ",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  },
})

local map_opts = { noremap = true, silent = true }

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
vim.api.nvim_set_keymap("n", "<leader>jf", "<cmd>Lspsaga lsp_finder<CR>", map_opts)

-- Code action
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Lspsaga code_action<CR>", map_opts)
vim.api.nvim_set_keymap("v", "<leader>f", "<cmd>Lspsaga code_action<CR>", map_opts)

-- Rename all occurrences of the hovered word for the entire file
vim.api.nvim_set_keymap("n", "<leader>jr", "<cmd>Lspsaga rename<CR>", map_opts)

-- Go to definition
vim.api.nvim_set_keymap("n","<leader>jd", "<cmd>vsp | Lspsaga goto_definition<CR>", map_opts)

-- Show line diagnostics
vim.api.nvim_set_keymap("n", "<leader>ei", "<cmd>Lspsaga show_line_diagnostics<CR>", map_opts)

-- Show buffer diagnostics
vim.api.nvim_set_keymap("n", "<leader>eo", "<cmd>Lspsaga show_buf_diagnostics<CR>", map_opts)

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
vim.api.nvim_set_keymap("n", "<leader>ep", "<cmd>Lspsaga diagnostic_jump_prev<CR>", map_opts)
vim.api.nvim_set_keymap("n", "<leader>en", "<cmd>Lspsaga diagnostic_jump_next<CR>", map_opts)

-- Toggle outline
vim.api.nvim_set_keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>", map_opts)

-- Hover Doc
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>Lspsaga hover_doc<CR>", map_opts)
