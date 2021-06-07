local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = {'html', 'css', 'json', 'jsdoc', 'javascript', 'typescript', 'python', 'lua', 'tsx', 'svelte'},
  -- indent = { enable = true },
  highlight = {
    enable = true,
    use_languagetree = true
  },
  autotag = {
    enable = true,
  }
}
