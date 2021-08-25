local schema = require('mycolor').schema

local modes = setmetatable(
{
    n       = { text = 'NOR', color = schema.purple },
    i       = { text = 'INS', color = schema.teal },
    c       = { text = 'CMD', color = schema.orange },
    v       = { text = 'VIS', color = schema.blue },
    V       = { text = 'L·V', color = schema.blue },
    ['']  = { text = 'B·V', color = schema.blue },
    R       = { text = 'REP', color = schema.red },
  },
  { -- this is fallback if key not exist
    __index = function()
      return 'UNK'
    end
  }
)

local function get_current_mode()
  local cur_mode = vim.fn.mode()
  vim.cmd(string.format("hi StatusLineMode guibg=%s", modes[cur_mode].color))
  return modes[cur_mode].text
end

local function get_file_info()
  local file_name = vim.fn.expand('%:t')
  if file_name == '' then file_name = '[No Name]' end
  local file_extension = vim.fn.expand('%:e')
  local read_only_icon = vim.bo.filetype == 'help' and vim.bo.readonly == true and '  ' or ''
  local modified_icon = ''
  if vim.bo.modifiable then
    if vim.bo.modified then
      modified_icon = ' '
      vim.cmd(string.format("hi StatusLineFileName guifg=%s", schema.red))
    else
      vim.cmd(string.format("hi StatusLineFileName guifg=%s", schema.gray10))
    end
  end
  return string.format("%s %s %s ", read_only_icon, file_name, modified_icon)
end

local function get_lsp_count()
  if vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    return ''
  end
  local diag = ''
  local error_count = vim.lsp.diagnostic.get_count(0, 'Error')
  if error_count > 0 then
    diag = diag .. string.format("%%#StatusLineLspError# %s ", error_count)
  end

  local warning_count = vim.lsp.diagnostic.get_count(0, 'Warning')
  if warning_count > 0 then
    diag = diag .. string.format("%%#StatusLineLspWarn# %s ", warning_count)
  end

  local info_count = vim.lsp.diagnostic.get_count(0, 'Information')
  if info_count > 0 then
    diag = diag .. string.format("%%#StatusLineLspInfo# %s ", info_count)
  end

  local hint_count = vim.lsp.diagnostic.get_count(0, 'Hint')
  if hint_count > 0 then
    diag = diag .. string.format("%%#StatusLineLspInfo#💡%s", hint_count)
  end
  return diag
end

local function get_ln_col()
  local line = vim.fn.line('.')
  local column = vim.fn.col('.')
  return string.format("%3d :%2d ", line, column)
end

_G.set_active = function()
  local statusline = ''
  -- double %% to get % in string
  -- pattern is %#HightlightGroup#sometext
  statusline = statusline .. string.format("%%#StatusLineMode# %s ", get_current_mode())
  statusline = statusline .. string.format("%%#StatusLineFileName#%s%%#StatusLineBg#", get_file_info())
  statusline = statusline .. string.format(" %s", get_lsp_count())

  -- Right section
  statusline = statusline .. "%="
  statusline = statusline .. string.format("%%#StatusLineMode# %s", get_ln_col())
  return statusline
end

_G.set_inactive = function()
  vim.wo.statusline = string.format("%%#StatusLineInactiveFileName#%s", get_file_info())
end

vim.cmd [[
  augroup Statusline
	au!
	au WinEnter,BufEnter * setlocal statusline=%!v:lua.set_active()
	au WinLeave,BufLeave * lua set_inactive()
	au WinEnter,BufEnter,FileType NvimTree,startify lua set_inactive()
  augroup END
]]
