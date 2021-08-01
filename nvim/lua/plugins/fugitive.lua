vim.opt.diffopt = vim.opt.diffopt + 'vertical'
vim.api.nvim_set_keymap('', '<Leader>gb', ':Git blame<CR>',{})
