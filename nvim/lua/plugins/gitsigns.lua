require('gitsigns').setup({
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+'},
    change       = {hl = 'GitSignsChange', text = '~'},
    delete       = {hl = 'GitSignsDelete', text = '-'},
  },
  keymaps = {},
  sign_priority = 4,
})
