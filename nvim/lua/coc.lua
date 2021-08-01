local u = require('utils')

vim.g['coc_global_extensions'] = { 'coc-html', 'coc-css', 'coc-angular', 'coc-highlight',  'coc-tsserver', 'coc-json', 'coc-svelte', 'coc-prettier'}

vim.cmd([[nmap <silent> <leader>jd <Plug>(coc-definition)]])
vim.cmd([[nmap <silent> <leader>jr <Plug>(coc-references)]])
vim.cmd([[nmap <silent> <leader>ji <Plug>(coc-implementation)]])
vim.cmd([[nmap <silent> <leader>en <Plug>(coc-diagnostic-next)]])
vim.cmd([[nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)]])
vim.cmd([[nmap <silent> <leader>f  <Plug>(coc-fix-current)]])

-- Use <Tab> and <S-Tab> to navigate through popup menu
u.map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {noremap = true, expr = true})
u.map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {noremap = true, expr = true})

u.map('n', '<leader>h', ':lua show_documentation()<CR>', { noremap = false, silent = false });
u.map('n', '<leader>p', ':CocCommand prettier.formatFile<CR>', { noremap = false, silent = false });

function show_documentation()
   local filetype = vim.bo.filetype

   if filetype == 'vim'  or filetype == 'help' then
    vim.api.nvim_command('h ' .. filetype)

   elseif (vim.fn['coc#rpc#ready']()) then
    vim.fn.CocActionAsync('doHover')
   end
end


vim.cmd([[autocmd CursorHold * silent call CocActionAsync('highlight')]])

-- use this for coc-css
vim.cmd([[autocmd FileType scss setl iskeyword+=@-@]])
