local u = require('utils')

-- g['$FZF_DEFAULT_COMMAND'] = [[ag --hidden --ignore .git --ignore node_modules -l -g ""]]
--g['$FZF_DEFAULT_OPTS'] = '--color hl:underline:reverse,hl+:underline:reverse'
vim.cmd([[let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore node_modules -l -g ""']])
u.map('', '<C-p>', ':Files<CR>', {silent = true})
u.map('n', '<leader>ag', ':Ag<CR>', {silent = true})
vim.g.fzf_colors = {
  fg = {'fg', 'Comment'},
  bg = {'bg', 'Normal'},
  hl = {'fg', 'Normal'},
  ['fg+'] = {'fg', 'Normal'},
  ['bg+'] = {'bg', 'CursorColumn'},
  ['hl+'] = {'fg', 'Statement'},
  info = {'fg', 'PreProc'},
  border =  {'fg', 'Type'},
  prompt =  {'fg', 'WarningMsg'},
  pointer = {'fg', 'Exception'},
  marker =  {'fg', 'Keyword'},
  spinner = {'fg', 'Label'},
  header = {'fg', 'Comment'} ,
  gutter = {'bg', 'Normal'},
  ['preview-fg'] = {'fg', 'Normal'}
  },
vim.cmd([[command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path "36;0"', fzf#vim#with_preview(), <bang>0)]])
