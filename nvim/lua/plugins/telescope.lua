local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    path_display={"smart"},
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
    scroll_strategy = 'limit',
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    prompt_prefix = ' 🔍  ',
    selection_caret = '  ',
  },

  pickers = {
    find_files = {
      -- find_command = { "rg", "--files", "--ignore-file", vim.fn.expand("~/.config/.ignore") }
    }
  },
  -- extensions = {
  --   fzf = {
  --     fuzzy = true,                    -- false will only do exact matching
  --     override_generic_sorter = true,  -- override the generic sorter
  --     override_file_sorter = true,     -- override the file sorter
  --   }
  -- }
})

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ag', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
