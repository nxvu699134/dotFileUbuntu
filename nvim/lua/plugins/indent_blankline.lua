vim.opt.colorcolumn = "99999"
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
  'class',
  'function',
  'method',
  '^array',
  'body',
  'type',
  '^with',
  '^try',
  '^except',
  '^catch',
  '^if',
  '^while',
  '^for',
  '^object',
  '^table',
  'block',
  'arguments',
  'element'}
vim.g.indent_blankline_filetype_exclude = {'help', 'startify', 'fzf'}
-- vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_char = '┊'

