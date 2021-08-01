local schema = require('mycolor').schema

local separator =
{
  open = "",
  close = "",
}

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

local hls = {
  bg = {group="StatusLineBg",     bg=schema.gray2 },
  mode = {group="StatusLineMode",      fg=schema.gray0,  bg=modes.n.color, style='bold' },
  file_name = {group="StatusLineFileName",  fg=schema.gray10,  bg=schema.gray3},
  sep_file = {group="StatusLineSepFile",    fg=schema.gray3, bg=schema.gray2},
  lsp_error = {group="StatusLineLspError",  fg=schema.diag.danger.fg, bg=schema.gray2 },
  lsp_warn = {group="StatusLineLspWarn",   fg=schema.diag.warning.fg,  bg=schema.gray2},
  lsp_info = {group="StatusLineLspInfo",   fg=schema.diag.info.fg,  bg=schema.gray2 },
  sep_mode_edge = {group="StatusLineSepMode",   fg=modes.n.color,   bg='NONE'},
  sep_mode_file = {group="StatusLineSepModeFile",   fg=modes.n.color,   bg=schema.gray3},
  sep_mode_bg = {group="StatusLineSepModeBg",   fg=modes.n.color,   bg=schema.gray2},
  inactive_sep_edge = {group="StatusLineInactiveSepEdge",   fg=schema.gray2,   bg='NONE'},
  inactive_file_name = {group="StatusLineInactiveFileName",  fg=schema.gray5, bg=schema.gray2 },
}

local function get_current_mode()
  local cur_mode = vim.fn.mode()
  vim.cmd(string.format("hi %s guibg=%s", hls.mode.group, modes[cur_mode].color))
  vim.cmd(string.format("hi %s guifg=%s", hls.sep_mode_edge.group, modes[cur_mode].color))
  vim.cmd(string.format("hi %s guifg=%s", hls.sep_mode_file.group, modes[cur_mode].color))
  vim.cmd(string.format("hi %s guifg=%s", hls.sep_mode_bg.group, modes[cur_mode].color))
  return modes[cur_mode].text
end

local function get_file_info()
  local file_name = vim.fn.expand('%:t')
  if file_name == '' then file_name = '[No Name]' end
  local file_extension = vim.fn.expand('%:e')
  local read_only_icon = vim.bo.filetype == 'help' and vim.bo.readonly == true and '  ' or ''
  local modified_icon = '  '
  if vim.bo.modifiable then
    if vim.bo.modified then
      modified_icon = ' '
      vim.cmd(string.format("hi %s guifg=%s", hls.file_name.group, schema.red))
    else
      vim.cmd(string.format("hi %s guifg=%s", hls.file_name.group, schema.gray10))
    end
  end
  return string.format("%s %s %s", read_only_icon, file_name, modified_icon)
end

local function get_lsp_count()
  if vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    return ''
  end
  local diag = ''
  local error_count = vim.lsp.diagnostic.get_count(0, 'Error')
  if error_count > 0 then
    diag = diag .. string.format("%%#%s# %s ", hls.lsp_error.group, error_count)
  end

  local warning_count = vim.lsp.diagnostic.get_count(0, 'Warning')
  if warning_count > 0 then
    diag = diag .. string.format("%%#%s# %s ", hls.lsp_warn.group, warning_count)
  end

  local info_count = vim.lsp.diagnostic.get_count(0, 'Information') + vim.lsp.diagnostic.get_count(0, 'Hint')
  if info_count > 0 then
    diag = diag .. string.format("%%#%s# %s", hls.lsp_info.group, info_count)
  end
  return diag
end

local function get_ln_col()
  local line = vim.fn.line('.')
  local column = vim.fn.col('.')
  return string.format("%3d :%2d ", line, column)
end

local function setup_highlight()
  local u = require('utils')
  for _, info in pairs(hls) do
    u.highlight(info.group, info)
  end
end

setup_highlight()

_G.set_active = function()
  local statusline = ''
  -- double %% to get % in string
  -- pattern is %#HightlightGroup#sometext
  statusline = statusline .. string.format("%%#%s#%s%%#%s#%s%%#%s#%s", hls.sep_mode_edge.group, separator.open, hls.mode.group, get_current_mode(), hls.sep_mode_file.group, separator.close)
  statusline = statusline .. string.format("%%#%s#%s%%#%s#%s%%#StatusLineBg#", hls.file_name.group, get_file_info(), hls.sep_file.group, separator.close)
  statusline = statusline .. string.format(" %s",get_lsp_count())

  -- Right section
  statusline = statusline .. "%="
  statusline = statusline .. string.format("%%#%s#%s%%#%s#%s%%#%s#%s", hls.sep_mode_bg.group, separator.open, hls.mode.group, get_ln_col(), hls.sep_mode_edge.group, separator.close)
  return statusline
end

_G.set_inactive = function()
  local statusline = ''
  statusline = statusline .. string.format("%%#%s#%s%%#StatusLineBg#", hls.inactive_sep_edge.group, separator.open)
  statusline = statusline .. string.format("%%#%s#%s", hls.inactive_file_name.group, get_file_info())

  -- Right section
  statusline = statusline .. "%="
  statusline = statusline .. string.format("%%#%s#%s", hls.inactive_sep_edge.group, separator.close)
  vim.wo.statusline = statusline
end

vim.cmd [[
  augroup Statusline
	au!
	au WinEnter,BufEnter * setlocal statusline=%!v:lua.set_active()
	au WinLeave,BufLeave * lua set_inactive()
	au WinEnter,BufEnter,FileType NvimTree,startify lua set_inactive()
  augroup END
]]
