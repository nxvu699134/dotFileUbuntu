require('Comment').setup({
  toggler = {
    line = '<leader>cc',
    block = 'gcb',
    },
  opleader = {
    line = '<leader>c',
    block = '<Nop>',
  },
  mappings = {
    basic = true,
    extra = false,
    extended = false,
  },
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
