vim.g.mapleader = ","
vim.g.loaded_gzip         = 1
vim.g.loaded_tar          = 1
vim.g.loaded_tarPlugin    = 1
vim.g.loaded_zipPlugin    = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw        = 1
vim.g.loaded_netrwPlugin  = 1
vim.g.loaded_matchit      = 1
vim.g.loaded_matchparen   = 1
vim.g.loaded_spec         = 1

-------------------- PLUGINS -------------------------------
vim.cmd('packadd packer.nvim')         -- Load package
require('packer').startup(function()
  -- Packer can manage itself as an u.optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {
    'kyazdani42/nvim-tree.lua',
    keys = {'<leader>ls', '<leader>lf'},
    config = function() require('plugins.nvim_tree') end
  }

  use {'kyazdani42/nvim-web-devicons'}

  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use {'junegunn/fzf.vim', config = function() require('plugins.fzf') end}

  use {'mhinz/vim-startify', config = function() require('plugins.startify') end}

  use {
    'scrooloose/nerdcommenter',
    keys = {'<leader>cc', '<leader>cu'},
    config = function() require('plugins.nerdcommenter') end
  }

  use {'tpope/vim-surround'}

  use {
    'lukas-reineke/indent-blankline.nvim',
    -- event = "BufRead",
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
    config = function() require('plugins.treesitter') end
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function() require('nvim-ts-autotag').setup() end
  }

  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function() require('nvim-autopairs').setup() end,
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
    'hrsh7th/nvim-compe', 
    event = 'InsertEnter',
    config = function() require('plugins.compe') end,
  }

  use {'ray-x/lsp_signature.nvim'}

  use {
    'mhartington/formatter.nvim',
    config = function() require('plugins.formatter') end
  }

  -- use {"neoclide/coc.nvim", branch = "release"}
end)

-- require('vn-night').setup()
-- require('vn-night.galaxyline')
require('mycolor').setup()
require('statusline')
require('mics')
require('lsp')
