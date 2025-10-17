local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader           = ","
vim.g.loaded_gzip         = 1
vim.g.loaded_tar          = 1
vim.g.loaded_tarPlugin    = 1
vim.g.loaded_zipPlugin    = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw        = 1
vim.g.loaded_netrwPlugin  = 1
vim.g.loaded_spec         = 1
vim.g.skip_ts_context_commentstring_module = true
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

-------------------- PLUGINS -------------------------------
local plugins = {
  {
    'nvim-tree/nvim-tree.lua',
    config = function() require('plugins.nvim_tree') end,
  },

  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },

  -- {'junegunn/fzf',
  --   run = function() vim.fn['fzf#install']() end
  -- }
  --
  -- {'junegunn/fzf.vim',
  --   config = function() require('plugins.fzf') end
  -- }

  {
    'mhinz/vim-startify',
    config = function() require('plugins.startify') end
  },

  {'tpope/vim-surround', event = 'VeryLazy'},

  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = function() require('plugins.indent_blankline') end
  },

  {
    'tpope/vim-fugitive',
    config = function() require('plugins.fugitive') end,
  },

  {
    'matze/vim-move',
    config = function()
      vim.g.move_normal_option = 1
      vim.g.move_key_modifier = 'A'
      vim.g.move_key_modifier_visualmode = 'A'
    end,
  },

  {'wellle/targets.vim'},

  {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    -- commit = '59d4c14a1a4262cf637ff2420032593afa062749',
  },

  {
    'windwp/nvim-ts-autotag',
    config = function() require('nvim-ts-autotag').setup() end
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function() require('nvim-autopairs').setup({map_cr = true}) end,
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.gitsigns') end
  },

  {
    'neovim/nvim-lspconfig',
    -- config = function() require('configs.lsp') end,
  },

  {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.cmp') end,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
  },

  -- {
  --   'ray-x/lsp_signature.nvim',
  --   event = "InsertEnter",
  --   opts = {
  --     bind = true, -- This is mandatory, otherwise border config won't get registered.
  --     doc_lines = 2,
  --     max_height = 4,
  --     floating_window = true,
  --     floating_window_above_cur_line = true,
  --     padding = " ",
  --     hint_enable = false,
  --     hi_parameter = "SpellLocal",
  --     hint_prefix = "  ",
  --     hint_scheme = "Ignore",
  --     handler_opts = {
  --       border = "rounded",
  --     },
  --   }
  -- },

  {
    'mhartington/formatter.nvim',
    config = function() require('plugins.formatter') end,
    event = 'VeryLazy',
  },

  {
    'rhysd/clever-f.vim',
    config = function() require('plugins.clever_f') end,
  },

  {
    'numToStr/Comment.nvim',
    config = function() require('plugins.comment_nvim') end,
    event = 'VeryLazy',
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup{}
    end,
    lazy = true,
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    config = function() require('plugins.telescope') end,
    -- lazy = true,
    -- cmd = "Telescope",
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "BufRead",
    config = function() require("plugins.lspsaga") end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function() require("plugins.noice") end,
  }
}

local opts = {}
require("lazy").setup(plugins, opts)
require("configs")

-- print(vim.fn.getenv('TEST'))
