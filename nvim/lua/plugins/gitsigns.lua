require('gitsigns').setup({
  signs = {
    add          = {text = '+'},
    change       = {text = '~'},
    delete       = {text = '-'},
    changedelete = {text = '~'},
  },
  sign_priority = 4,
})
