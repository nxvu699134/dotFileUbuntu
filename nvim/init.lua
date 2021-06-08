vim.g.mapleader = ","

-------------------- HELPERS -------------------------------
local u = require('utils')

-------------------- PLUGINS -------------------------------
vim.cmd('packadd packer.nvim')         -- Load package
 require('packer').startup(function()
  -- Packer can manage itself as an u.optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {'glepnir/galaxyline.nvim'}

  use {'kyazdani42/nvim-tree.lua'}
   --use {'kyazdani42/nvim-web-devicons'}
  use {'nxvu699134/nvim-web-devicons'}
  use {'nxvu699134/vn-night.nvim'}

  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use {'junegunn/fzf.vim'}

  use {'mhinz/vim-startify'}

  use {'scrooloose/nerdcommenter'}

  use {'tpope/vim-surround'}

  use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}

  use {'airblade/vim-gitgutter'}
  use {'tpope/vim-fugitive'}

  use {'matze/vim-move'}

  use {'wellle/targets.vim'}

  use {'jiangmiao/auto-pairs'}

  use {'nvim-treesitter/nvim-treesitter'}
  use {'windwp/nvim-ts-autotag'}


  -- use {'sbdchd/neoformat'}
  -- use {'neovim/nvim-lspconfig'}
  -- use {'hrsh7th/nvim-compe'}
  -- use {'ray-x/lsp_signature.nvim'}
  -- use 'glepnir/lspsaga.nvim'

  use {"neoclide/coc.nvim", branch = "release"}

-- HTML, CSS
  use {'alvan/vim-closetag'}

end)

-----------------------COLOR SCHEME-----------------------
-- vim.cmd 'syntax enable'
-- vim.cmd([[let $NVIM_TUI_ENABLE_TRUE_COLOR = 1]])
-- vim.cmd('colorscheme vn-night')

require('vn-night').setup()
require('vn-night.galaxyline')

-- require('colors').setup()
--
-- require('statusline')

require('file_explorer')

require('fzf')

require('git')

require('commenter')

require('TSitter')

-- require('completion')
-- require('lsp')
-- require('formatter')

require('coc')

require('startify')

require('mics')
