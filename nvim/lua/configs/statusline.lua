local schema = require('configs.colorscheme').schema

local modes = setmetatable(
  {
    n       = { text = 'NOR', color = schema.cyan },
    i       = { text = 'INS', color = schema.blue },
    c       = { text = 'CMD', color = schema.orange },
    v       = { text = 'VIS', color = schema.purple },
    V       = { text = 'L·V', color = schema.purple },
    ['']  = { text = 'B·V', color = schema.purple },
    R       = { text = 'REP', color = schema.red },
  },
  { -- this is fallback if key not exist
    __index = function()
      return 'UNK'
    end
  }
)

local sep = {
  open = "",
  close = "",
}

local function get_current_mode()
  local cur_mode = vim.api.nvim_get_mode().mode
  vim.cmd(string.format("hi StatusLineMode guibg=%s", modes[cur_mode].color))
  vim.cmd(string.format("hi StatusLineSepMode_0 guifg=%s", modes[cur_mode].color))
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
      modified_icon = '󰳼 '
      vim.cmd(string.format("hi StatusLineFileName guifg=%s", schema.red))
    else
      vim.cmd(string.format("hi StatusLineFileName guifg=%s", schema.gray[11]))
    end
  end
  return string.format("%s %s %s", read_only_icon, file_name, modified_icon)
end

local function get_file_type()
  file_name = vim.fn.expand('%:t')
  file_extension = vim.fn.expand('%:e')
  icon = require'nvim-web-devicons'.get_icon(file_name, file_extension)
  icon = icon == nil and '' or icon
  file_type = vim.bo.filetype
  if file_type == '' then file_type = 'No ft' end
  return icon .. ' ' .. file_type
end

local function get_lsp_count()
  if vim.tbl_isempty(vim.lsp.get_clients({buffer=0})) then
    return ''
  end
  local diag = ''
  local error_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  if error_count > 0 then
    diag = diag .. string.format("%%#StatusLineLspError# %s ", error_count)
  end

  local warning_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  if warning_count > 0 then
    diag = diag .. string.format("%%#StatusLineLspWarn# %s ", warning_count)
  end

  local info_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  if info_count > 0 then
    diag = diag .. string.format("%%#StatusLineLspInfo# %s ", info_count)
  end

  local hint_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  if hint_count > 0 then
    diag = diag .. string.format("%%#StatusLineLspInfo#💡%s", hint_count)
  end
  return diag
end

local function get_ln_col()
  local pos = vim.api.nvim_win_get_cursor(0)
  return string.format("%3d :%2d ", pos[1], pos[2])
end

function _G.active_line()
  -- double %% to get % in string
  -- pattern is %#HightlightGroup#sometext
  return string.format("%%#StatusLineSepMode_0#%s", sep.open)
      .. string.format("%%#StatusLineMode#%s ", get_current_mode())
      .. string.format("%%#StatusLineFileName#%s", get_file_info())
      .. string.format("%%#StatusLineSep1_Bg#%s", sep.close)
      .. "%#StatusLineBg#"
      .. string.format(" %s", get_lsp_count())
      .. "%=" -- Right section
      .. string.format("%%#StatusLineMode# %s", get_ln_col())
      .. " %P"
      .. string.format("%%#StatusLineSepMode_0#%s", sep.close)
end

function _G.inactive_line()
  return string.format("%%#StatusLineSepInactive#%s", sep.open)
      .. string.format("%%#StatusLineInactiveFileName#%s", get_file_info())
      .. "%#StatusLineBg#"
      .. "%=" -- Right section
      .. string.format("%%#StatusLineSepInactive#%s", sep.close)
end

vim.cmd [[
  augroup Statusline
	au!
	au WinEnter,BufEnter * setlocal statusline=%!v:lua.active_line()
  au WinLeave,BufLeave * setlocal statusline=%{%v:lua.inactive_line()%}
	au WinEnter,BufEnter,FileType NvimTree,startify setlocal statusline=%{%v:lua.inactive_line()%}
  augroup END
]]
