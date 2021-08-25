local lsp_kinds = {
  Text          = " Text",
  Method        = " Method",
  Function      = "⨕ Func",
  Constructor   = " Cons",
  Field         = " Field",
  Variable      = " Var",
  Class         = " Class",
  Interface     = " Interface",
  Module        = " Module",
  Property      = " Prop",
  Unit          = " Unit",
  Value         = " Value",
  Enum          = "了Enum",
  Keyword       = " Keyword",
  Snippet       = " Snippet",
  Color         = " Color",
  File          = " File",
  Reference     = "渚Ref",
  Folder        = " Folder",
  EnumMember    = " EnumMem",
  Constant      = " Const",
  Struct        = "ﳤ Struct",
  Event         = " Event",
  Operator      = " Operator",
  TypeParameter = " TypeParam"
}

local format_entry  = function(entry, vim_item)
  vim_item.kind = lsp_kinds[vim_item.kind]
  return vim_item
end

local cmp = require('cmp')
cmp.setup {
  -- You must set mapping.
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  
  formatting = {
    format = format_entry
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' }
  },
}
