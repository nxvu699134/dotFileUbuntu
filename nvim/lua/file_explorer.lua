local u = require('utils')

vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_width_allow_resize  = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_disable_window_picker = 1

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["<CR>"]           = tree_cb("edit"),
  ["o"]              = tree_cb("edit"),
  ["v"]              = tree_cb("vsplit"),
  ["s"]              = tree_cb("split"),
  ["<BS>"]           = tree_cb("close_node"),
  ["<S-CR>"]         = tree_cb("close_node"),
  ["I"]              = tree_cb("toggle_ignored"),
  ["H"]              = tree_cb("toggle_dotfiles"),
  ["R"]              = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["d"]              = tree_cb("remove"),
  ["r"]              = tree_cb("rename"),
  ["x"]              = tree_cb("cut"),
  ["c"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["q"]              = tree_cb("close"),
  ["<Nop>"]          = tree_cb("preview"),
  ["<Nop>"]          = tree_cb("prev_git_item"),
  ["<Nop>"]          = tree_cb("next_git_item"),
  ["<Nop>"]          = tree_cb("dir_up"),
  ["<Nop>"]          = tree_cb("full_rename"),
  ["<Nop>"]          = tree_cb("cd"),
  ["<Nop>"]          = tree_cb("tabnew"),
}
u.map('', '<leader>ls', ':NvimTreeToggle<CR>', {silent = true})
u.map('', '<leader>lf', ':NvimTreeFindFile<CR>', {silent = true})
vim.cmd('autocmd BufWinEnter NvimTree setlocal cursorline')
