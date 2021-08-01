
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 2;
  preselect = 'disable';
  throttle_time = 200;
  source_timeout = 200;
  incomplete_delay = 400;
  -- max_abbr_width = 40;
  -- max_kind_width = 40;
  -- max_menu_width = 40;
  documentation = { border = "single", },

  source = {
    nvim_lsp = { priority = 1000 },
    path = { priority = 100 },
    buffer = { priority = 10 },
    nvim_lua = { priority = 10 },
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

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
