vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_disable_window_picker = 1


local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local map_list = {
  { key = "<CR>",         cb = tree_cb("edit") },
  { key = "v",            cb = tree_cb("vsplit") },
  { key = "s",            cb = tree_cb("split") },
  { key = "<BS>",         cb = tree_cb("close_node") },
  { key = "<S-CR>",       cb = tree_cb("close_node") },
  { key = "I",            cb = tree_cb("toggle_ignored") },
  { key = "H",            cb = tree_cb("toggle_dotfiles") },
  { key = "R",            cb = tree_cb("refresh") },
  { key = "a",            cb = tree_cb("create") },
  { key = "d",            cb = tree_cb("remove") },
  { key = "r",            cb = tree_cb("rename") },
  { key = "x",            cb = tree_cb("cut") },
  { key = "c",            cb = tree_cb("copy") },
  { key = "p",            cb = tree_cb("paste") },
  { key = "q",            cb = tree_cb("close") },
  { key = "?",            cb = tree_cb("toggle_help") },
  { key = "y",            cb = tree_cb("copy_name") },
  { key = "Y",            cb = tree_cb("copy_path") },
  { key = "yp",           cb = tree_cb("copy_absolute_path") },
  { key = "<Nop>",        cb = tree_cb("cd") },
  { key = "<Nop>",        cb = tree_cb("tabnew") },
  { key = "<Nop>",        cb = tree_cb("prev_sibling") },
  { key = "<Nop>",        cb = tree_cb("next_sibling") },
  { key = "<Nop>",        cb = tree_cb("parent_node") },
  { key = "<Nop>",        cb = tree_cb("preview") },
  { key = "<Nop>",        cb = tree_cb("first_sibling") },
  { key = "<Nop>",        cb = tree_cb("last_sibling") },
  { key = "<Nop>",        cb = tree_cb("full_rename") },
  { key = "<Nop>",        cb = tree_cb("prev_git_item") },
  { key = "<Nop>",        cb = tree_cb("next_git_item") },
  { key = "<Nop>",        cb = tree_cb("dir_up") },
}

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache' }
  },
  view = {
    width = 36,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = true,
      list = map_list
    }
  }
}


vim.api.nvim_set_keymap('', '<leader>ls', ':NvimTreeToggle<CR>', {silent = true})
vim.api.nvim_set_keymap('', '<leader>lf', ':NvimTreeFindFile<CR>', {silent = true})
vim.cmd('autocmd BufWinEnter NvimTree setlocal cursorline')

-- vim.api.nvim_set_keymap('', '<leader>ls', ':NERDTreeToggle<CR>', {silent = true})
-- vim.api.nvim_set_keymap('', '<leader>lf', ':NERDTreeFind<CR>', {silent = true})
--
-- vim.g.NERDTreeMapMenu='m'
-- vim.g.NERDTreeIgnore={'node_modules', '.git', 'node_modules', '.cache'}
--
-- -- Automaticaly close nvim if NERDTree is only thing left open
-- vim.cmd([[
-- autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
-- let NERDTreeMapOpenSplit = 's'
-- let NERDTreeMapOpenVSplit = 'v'
-- let NERDTreeMinimalUI=1
-- ]])
