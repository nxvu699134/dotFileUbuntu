local lsp_kinds = {
  Array         = " ",
  Boolean       = "󰨙 ",
  Class         = " Class",
  Color         = " Color",
  Constant      = "󰏿 Const",
  Constructor   = " Cons",
  Copilot       = " Copilot",
  Enum          = " Enum",
  EnumMember    = " EnumMem",
  Event         = " Event",
  Field         = "󰜢 Field",
  File          = " File",
  Folder        = " Folder",
  Function      = "󰊕 Func",
  Interface     = " Interface",
  Keyword       = "󰌋 Keyword",
  Method        = "󰊕 Method",
  Module        = " Module",
  Operator      = " Operator",
  Property      = " Prop",
  Package       = " Package",
  Number        = "󰎠 Number",
  Object        = "󰘦 Obj",
  Reference     = " Ref",
  Snippet       = " Snip",
  Struct        = "󰆼 Struct",
  String        = " Str",
  Text          = " Text",
  TypeParameter = " TParam",
  Unit          = "󰑭 Unit",
  Value         = "󰎠 Value",
  Variable      = "󰀫 Var",
}

local format_entry  = function(entry, vim_item)
  vim_item.kind = lsp_kinds[vim_item.kind]
  --cool setup to dedup items
  -- https://github.com/yifan0414/dotfiles/blob/master/.config/nvim/lua/plugins/nvim-cmp.lua
  -- vim_item.dup = ({
  --   luasnip = 1,
  --   nvim_lsp = 0,
  --   buffer = 0,
  --   path = 0,
  -- })[entry.source.name] or 0
  return vim_item
end

local cmp = require('cmp')
cmp.setup {
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },

  formatting = {
    format = format_entry
  },
  preselect = cmp.PreselectMode.None,
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path'  },
    { name = 'buffer' },
  },
}

