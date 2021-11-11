


vim.api.nvim_set_keymap('n', '<leader>da', [[:lua require'dap'.continue()<CR>]], {silent = true})
vim.api.nvim_set_keymap('n', '<leader>db', [[:lua require'dap'.toggle_breakpoint()<CR>]], {silent = true})
vim.api.nvim_set_keymap('n', '<leader>dj', [[:lua require'dap'.step_over()<CR>]], {silent = true})
vim.api.nvim_set_keymap('n', '<leader>dl', [[:lua require'dap'.step_into()<CR>]], {silent = true})
vim.api.nvim_set_keymap('n', '<leader>dh', [[:lua require'dap'.step_out()<CR>]], {silent = true})
vim.api.nvim_set_keymap('n', '<leader>di', [[:lua require'dapui'.toggle()<CR>]], {silent = true})
vim.api.nvim_set_keymap('n', '<leader>dc', [[:lua require'dapui'.run_to_cursor()<CR>]], {silent = true})
vim.api.nvim_set_keymap('n', '<leader>dx', [[:lua require'dapui'.close()<CR>]], {silent = true})


require('plugins.dap.go')


vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
