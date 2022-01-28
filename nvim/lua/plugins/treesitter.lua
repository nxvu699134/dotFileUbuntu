local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = {'html', 'css', 'json',
  'javascript', 'typescript', 'python', 'lua', 'tsx',
  'svelte', 'go'},
  indent = { enable = true },
  highlight = { enable = true },
  -- textobjects = {
  --   select = {
  --     enable = true,
  --
  --     -- Automatically jump forward to textobj, similar to targets.vim
  --     lookahead = true,
  --
  --     keymaps = {
  --       -- You can use the capture groups defined in textobjects.scm
  --       ["af"] = "@function.outer",
  --       ["if"] = "@function.inner",
  --       ["ac"] = "@conditional.outer",
  --       ["ic"] = "@conditional.inner",
  --       ["ap"] = "@parameter.outer",
  --       ["ip"] = "@parameter.inner",
  --       ["al"] = "@loop.outer",
  --       ["il"] = "@loop.inner",
  --     },
  --   },
  -- },
}
