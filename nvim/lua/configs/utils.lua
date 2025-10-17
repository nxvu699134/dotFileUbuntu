local function hex_to_rgb(hex)
  local hex_in_decimal = tonumber(string.sub(hex, 2), 16)
  local mask = 255
  return {
    r = bit.band(bit.rshift(hex_in_decimal, 16), mask),
    g = bit.band(bit.rshift(hex_in_decimal, 8), mask),
    b = bit.band(hex_in_decimal, mask),
  }
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02X%02X%02X", r, g, b)
end

local function rgba_to_rgb(color_hex, background, alpha)
  -- Docs
  -- https://ciechanow.ski/alpha-compositing/
  local c = hex_to_rgb(color_hex)
  local bg = hex_to_rgb(background)
  local new_r = (1 - alpha) * bg.r + alpha * c.r
  local new_g = (1 - alpha) * bg.g + alpha * c.g
  local new_b = (1 - alpha) * bg.b + alpha * c.b
  return rgb_to_hex(new_r, new_g, new_b)
end

local function hsl_to_hex(h, s, l)
  s = s / 100
  l = l / 100
  local function k(n)
    return (n + h / 30) % 12
  end
  local a = s * math.min(l, 1 - l)
  local function f(n)
    return l - a * math.max(-1, math.min(k(n) - 3, math.min(9 - k(n), 1)))
  end
  return rgb_to_hex(math.floor(255 * f(0) + 0.5), math.floor(255 * f(8) + 0.5), math.floor(255 * f(4) + 0.5))
end


local function parse_style(style_str)
  local ret = {}
  if not style_str or style_str == "NONE" then
    return ret
  end

  for token in string.gmatch(style_str, "([^,]+)") do
    ret[token] = true
  end

  return ret
end

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local function nvim_hl(group, opt)
  local hl_opt = parse_style(opt.style)
  local DEFAULT = 'NONE'
  hl_opt.bg = opt.bg and opt.bg or DEFAULT
  hl_opt.fg = opt.fg and opt.fg or DEFAULT
  vim.api.nvim_set_hl(0, group, hl_opt)
end

local function highlight(group, color)
  local DEFAULT = 'NONE'
  local fg = color.fg and color.fg or DEFAULT
  local bg = color.bg and color.bg or DEFAULT
  local style = color.style and color.style or DEFAULT
  local cmd = string.format("highlight %s guifg=%s guibg=%s gui=%s", group, fg, bg, style)
  vim.api.nvim_command(cmd)
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
  hsl_to_hex = hsl_to_hex,
	highlight = highlight,
  nvim_hl = nvim_hl,
  swap_win = swap_win
}
