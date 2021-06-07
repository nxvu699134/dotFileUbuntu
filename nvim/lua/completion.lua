local u = require('utils')

vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  -- max_abbr_width = 40;
  -- max_kind_width = 40;
  -- max_menu_width = 40;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- calc = true;
    -- vsnip = true;
  };
}

vim.lsp.protocol.CompletionItemKind = {
    " Text ",
    " Method",
    " Function",
    " Constructor",
    " Field",
    " Variable",
    " Class",
    " Interface",
    " Module",
    " Property",
    " Unit",
    " Value",
    "了Enum",
    " Keyword",
    " Snippet",
    " Color",
    " File",
    "渚Reference",
    " Folder",
    " EnumMember",
    " Constant",
    "ﳤ Struct",
    " Event",
    " Operator",
    " TypeParameter"
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  -- elseif vim.fn.call("vsnip#available", {1}) == 1 then
  --   return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  -- elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
  --   return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

u.map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
u.map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
u.map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
u.map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
