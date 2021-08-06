local function hex_to_rgb(hex)
  local hex_in_decimal = tonumber(string.sub(hex, 2), 16);
  local mask = 255;
  return {
    r = bit.band(bit.rshift(hex_in_decimal, 16), mask);
    g = bit.band(bit.rshift(hex_in_decimal, 8), mask);
    b = bit.band(hex_in_decimal, mask);
  }
end

local function rgba_to_rgb(color_hex, background, alpha)
  -- Docs
  -- https://ciechanow.ski/alpha-compositing/
  local c = hex_to_rgb(color_hex);
  local bg = hex_to_rgb(background);
  local new_r = (1 - alpha) * bg.r + alpha * c.r;
  local new_g = (1 - alpha) * bg.g + alpha * c.g;
  local new_b = (1 - alpha) * bg.b + alpha * c.b;
  return string.format("#%02X%02X%02X", new_r, new_g, new_b);
end

local function highlight(group, color)
  local style = color.style and 'gui=' .. color.style or 'gui=NONE'
  local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
  local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
  local sp = color.sp and 'guisp=' .. color.sp or ''
  vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' '.. sp)
end

local function swap_win(arg)
  -- :h winnr for more info
  local next_win = vim.fn.win_getid(vim.fn.winnr(arg))
  local next_buf = vim.api.nvim_win_get_buf(next_win)
  local cur_buf = vim.api.nvim_win_get_buf(vim.fn.win_getid())
  vim.cmd("buffer " .. next_buf)
  vim.fn.win_gotoid(next_win)
  vim.cmd("buffer " .. cur_buf)
end

return {
	hex_to_rgb = hex_to_rgb,
	rgba_to_rgb = rgba_to_rgb,
	highlight = highlight,
  swap_win = swap_win
}
