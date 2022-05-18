vim.g.mapleader           = ","
vim.g.loaded_gzip         = 1
vim.g.loaded_tar          = 1
vim.g.loaded_tarPlugin    = 1
vim.g.loaded_zipPlugin    = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw        = 1
vim.g.loaded_netrwPlugin  = 1
vim.g.loaded_spec         = 1

-------------------- PLUGINS -------------------------------
vim.cmd('packadd packer.nvim')         -- Load package
require('packer').startup(function()
  -- Packer can manage itself as an u.optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {
    'kyazdani42/nvim-tree.lua',
    -- commit = "a6c1d45dd6c26f7871f87564baf3860e0e5ac60c",
    config = function() require('plugins.nvim_tree') end
  }

  use {'kyazdani42/nvim-web-devicons'}

  use {'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  }

  use {'junegunn/fzf.vim',
    config = function() require('plugins.fzf') end
  }

  use {'mhinz/vim-startify',
    config = function() require('plugins.startify') end
  }

  use {'tpope/vim-surround'}

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugins.indent_blankline') end
  }

  use {
    'tpope/vim-fugitive',
    config = function() require('plugins.fugitive') end,
  }

  use {
    'matze/vim-move',
    config = function() vim.g.move_key_modifier = 'A' end
  }

  use {'wellle/targets.vim'}

  use {
    'nvim-treesitter/nvim-treesitter',
    -- commit = "808473cfbb41ef07b57397100f3593d7a6aa788f",
    config = function() require('plugins.treesitter') end,
  }

  -- use {'nvim-treesitter/nvim-treesitter-textobjects',
  --   branch = '0.5-compat',
  -- }

  use {
    'windwp/nvim-ts-autotag',
    config = function() require('nvim-ts-autotag').setup() end
  }

  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function() require('nvim-autopairs').setup({map_cr = true}) end,
  }


  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.gitsigns') end
  }

  -- use {'norcalli/nvim-colorizer.lua'}
  use {
    'neovim/nvim-lspconfig',
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.cmp') end,
    event = 'InsertEnter',
  }
  use {
    'hrsh7th/cmp-buffer',
    after = 'nvim-cmp'
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    after = 'nvim-cmp'
  }
  use {
    'hrsh7th/cmp-path',
    after = 'nvim-cmp'
  }
  use {
    'hrsh7th/cmp-vsnip',
    after = 'nvim-cmp'
  }
  use {
    'hrsh7th/vim-vsnip',
    after = 'nvim-cmp'
  }

  use {'ray-x/lsp_signature.nvim'}

  use {
    'mhartington/formatter.nvim',
    config = function() require('plugins.formatter') end
  }

  use {
    'rhysd/clever-f.vim',
    config = function() require('plugins.clever_f') end,
  }

  use {
    'numToStr/Comment.nvim',
    config = function() require('plugins.comment_nvim') end,
  }
end)

require('mycolor').setup()
require('statusline')
require('mics')
require('lsp')

-- print(vim.fn.getenv('TEST'))
