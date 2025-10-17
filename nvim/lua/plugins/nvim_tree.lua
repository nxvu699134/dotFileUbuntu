local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<S-CR>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'yp', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', '<Nop>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '<Nop>', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', '<Nop>', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', '<Nop>', api.node.navigate.sibling.next, opts('Next Sibling'))
  vim.keymap.set('n', '<Nop>', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', '<Nop>', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', '<Nop>', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', '<Nop>', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', '<Nop>', api.fs.rename_sub, opts('Rename: Omit Filename'))
  vim.keymap.set('n', '<Nop>', api.node.navigate.git.prev, opts('Prev Git'))
  vim.keymap.set('n', '<Nop>', api.node.navigate.git.next, opts('Next Git'))
  vim.keymap.set('n', '<Nop>', api.tree.change_root_to_parent, opts('Up'))

end

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_focused_file = {
    enable      = true,
    ignore_list = {}
  },
  filters = {
    enable = true,
    dotfiles = false,
    custom = { '.git', 'node_modules', '\\.cache' }
  },
  view = {
    width = 36,
    side = 'left',
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      }
    }
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    highlight_git = true,
  },
  on_attach = on_attach,
}


vim.api.nvim_set_keymap('', '<leader>ls', ':NvimTreeToggle<CR>', {silent = true})
vim.api.nvim_set_keymap('', '<leader>lf', ':NvimTreeFindFile<CR>', {silent = true})
vim.cmd('autocmd BufWinEnter NvimTree_1 setlocal cursorline')
