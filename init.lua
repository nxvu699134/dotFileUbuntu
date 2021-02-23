-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

g.mapleader = ","
-- cmd('filetype plugin indent on')

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- PLUGINS -------------------------------
cmd('packadd packer.nvim')         -- Load package
 require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- use {'tyrannicaltoucan/vim-deep-space'}
  use 'glepnir/zephyr-nvim'

  use {'itchyny/lightline.vim'}

  use {'kyazdani42/nvim-web-devicons'}
  use {'kyazdani42/nvim-tree.lua'}

  use {'junegunn/fzf', run = function() fn['fzf#install']() end}
  use {'junegunn/fzf.vim'}

  use {'mhinz/vim-startify'}

  use {'scrooloose/nerdcommenter'}

  use {'tpope/vim-surround'}

  use {'Yggdroot/indentLine'}

  use {'airblade/vim-gitgutter'}
  use {'tpope/vim-fugitive'}

  use {'matze/vim-move'}

  use {'wellle/targets.vim'}

  use {'jiangmiao/auto-pairs'}

  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-treesitter/nvim-treesitter-angular'}
  -- use{'tree-sitter-typescript/typescript'};
  -- use{'tree-sitter-typescript/tsx'};

  -- use 'neovim/nvim-lspconfig'
  -- use 'glepnir/lspsaga.nvim'
  -- use 'prabirshrestha/vim-lsp'
  -- use 'mattn/vim-lsp-settings'
  -- use 'nvim-lua/completion-nvim'

  use {"neoclide/coc.nvim", branch = "release"}

  use {'prettier/vim-prettier', run = 'npm install' }

-- HTML, CSS
  use {'alvan/vim-closetag'}

-- javascript, typescript
  use {'Shougo/echodoc.vim'}
  use {'heavenshell/vim-jsdoc'}
end)



-----------------------COLOR SCHEME-----------------------
cmd 'syntax enable'
g['$NVIM_TUI_ENABLE_TRUE_COLOR'] = 1
opt('o', 'termguicolors', true)
opt('o', 'background', 'dark')
-- g.deepspace_italics = 1
-- cmd 'colorscheme deep-space'

cmd 'colorscheme zephyr'

cmd('hi Normal guibg=NONE ctermbg=NONE')
cmd('hi LineNr guibg=NONE ctermbg=NONE')
cmd('hi SignColumn guibg=NONE ctermbg=NONE')
cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
-- Set invert matching bracket
cmd('hi! link MatchParen Search')

-----------------------LIGHTLINE-----------------------
g.lightline = {
  colorscheme = 'ayu_mirage',
    active = {
      left = {
        { 'mode', 'paste' },
        { 'readonly', 'filename', 'modified' }
      },
      right = {
	 	    {'lineinfo'},
		    { 'cocstatus', 'filetype'}
      }
    },
    inactive = {
      left = {
        {'filename', 'modified'}
      },
      right = {
        {'filename'}
      }
    },
    separator = { left = '', right = ''},
    subseparator = { left = '', right = ''}
}

------------------------NVIM TREE-----------------------
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_follow = 1
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
g.nvim_tree_width_allow_resize  = 1
g.nvim_tree_bindings = {
     edit=            {'<CR>', 'o'},
     edit_vsplit=     'v',
     edit_split=      's',
     edit_tab=        '<C-t>',
     close_node=      {'<S-CR>', '<BS>'},
     toggle_ignored=  'I',
     toggle_dotfiles= 'H',
     refresh=         'R',
     preview=         '<Tab>',
     cd=              '<Nop>',
     create=          'a',
     remove=          'd',
     rename=          'r',
     cut=             'x',
     copy=            'c',
     paste=           'p',
     prev_git_item=   'gp',
     next_git_item=   'gn',
     dir_up=          'u',
     close=           '<Nop>',
}
map('', '<leader>ls', ':NvimTreeToggle<CR>', {silent = true})
map('', '<leader>lf', ':NvimTreeFindFile<CR>', {silent = true})
cmd('autocmd FileType NvimTree setlocal cursorline')

----------------------FZF--------------------------------
-- g['$FZF_DEFAULT_COMMAND'] = [[ag --hidden --ignore .git --ignore node_modules -l -g ""]]
--g['$FZF_DEFAULT_OPTS'] = '--color hl:underline:reverse,hl+:underline:reverse'
cmd([[let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore node_modules -l -g ""']])
map('', '<C-p>', ':Files<CR>', {silent = true})
map('n', '<leader>ag', ':Ag<CR>', {silent = true})
g.fzf_colors = {
  fg = {'fg', 'Comment'},
  bg = {'bg', 'Normal'},
  hl = {'fg', 'Normal'},
  ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
  ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
  ['hl+'] = {'fg', 'Statement'},
  info = {'fg', 'PreProc'},
  border =  {'fg', 'Ignore'},
  prompt =  {'fg', 'Conditional'},
  pointer = {'fg', 'Exception'},
  marker =  {'fg', 'Keyword'},
  spinner = {'fg', 'Label'},
  header = {'fg', 'Comment'} ,
  gutter = {'bg', 'Normal'},
  ['preview-fg'] = {'fg', 'Normal'}
  },
cmd([[command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path "36;0"', fzf#vim#with_preview(), <bang>0)]])

----------------------NERD COMMENTER--------------------------------
--Add spaces after comment delimiters by default
g.NERDSpaceDelims = 1

--Use compact syntax for prettified multi-line comments
g.NERDCompactSexyComs = 1

--Align line-wise comment delimiters flush left instead of following code indentation
g.NERDDefaultAlign = 'left'

--Allow commenting and inverting empty lines (useful when commenting a region)
g.NERDCommentEmptyLines = 1

--Enable trimming of trailing whitespace when uncommenting
g.NERDTrimTrailingWhitespace = 1

--Enable NERDCommenterToggle to check all selected lines is commented or not
g.NERDToggleCheckAllLines = 1

-----------------------VIM FUGITIVE-----------------------------
cmd('set diffopt+=vertical')
map('', '<Leader>gb', ':Gblame<CR>')

-----------------------AUTO PAIRs-----------------------------
g.AutoPairsMultilineClose = 0

-----------------------VIM MOVE-----------------------------
g.move_key_modifier = 'C'

-----------------------VIM PRETTIER-------------------------
g['prettier#autoformat'] = 0
g['prettier#exec_cmd_async'] = 1
g['prettier#config#single_quote'] = 'true'

------------------- TREE-SITTER ---------------------------
local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = 'maintained',
  highlight = { enable = true }
}

------------------- COC NVIM ---------------------------
cmd([[nmap <silent> <leader>jd <Plug>(coc-definition)]])
cmd([[nmap <silent> <leader>jr <Plug>(coc-references)]])
cmd([[nmap <silent> <leader>ji <Plug>(coc-implementation)]])
cmd([[nmap <silent> <leader>en <Plug>(coc-diagnostic-next)]])
cmd([[nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)]])
cmd([[nmap <silent> <leader>f  <Plug>(coc-fix-current)]])

-- Use <Tab> and <S-Tab> to navigate through popup menu
map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {noremap = true, expr = true})
map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {noremap = true, expr = true})

-- nmap <silent> <leader>h :call <SID>show_documentation()<CR>

map('n', '<leader>h', ':lua show_documentation()<CR>', { noremap = false, silent = false });

function show_documentation()
   local filetype = vim.bo.filetype

   if filetype == 'vim'  or filetype == 'help' then
        vim.api.nvim_command('h ' .. filetype)

   elseif (fn['coc#rpc#ready']()) then
      fn.CocActionAsync('doHover')
   end
end

-- Avoid showing message extra message when using completion
opt('o', 'shortmess', vim.o.shortmess .. 'c')
opt('o', 'signcolumn', 'yes')

g.coc_status_error_sign = ''
g.coc_status_warning_sign = ' '
cmd([[autocmd CursorHold * silent call CocActionAsync('highlight')]])
-- cmd([[hi CocErrorLine guibg=#2e323c]])
cmd([[hi CocErrorHighlight guifg=#ff0000 ctermfg=15 gui=bold,undercurl cterm=bold,undercurl]])
-- cmd([[hi CocWarningLine guibg=#2e323c]])

--------------------NVIM LSP --------------------------------
-- map('n', '<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
-- map('n', '<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
-- map('n', '<leader>jd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- map('n', '<leader>jr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- -- map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- -- map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
-- - -map('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- map('n', '<leader>h', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
-- cmd([[autocmd BufEnter * lua require'completion'.on_attach()]])
--
-- local saga = require 'lspsaga'
-- saga.init_lsp_saga()
--
-- local lspconfig = require 'lspconfig'
--
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- local enhance_attach = function(client,bufnr)
--   if client.resolved_capabilities.document_formatting then
--     format.lsp_before_save()
--   end
--   api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
--
-- lspconfig.tsserver.setup {
--   on_attach = function(client)
--     client.resolved_capabilities.document_formatting = false
--     enhance_attach(client)
--   end
-- }
--
-- -- Set completeopt to have a better completion experience
-- cmd([[set completeopt=menuone,noinsert,noselect]])
--
-- --Avoid showing message extra message when using completion
-- cmd([[set shortmess+=c]])

------------------- ECHO DOC-----------------------------------
g['echodoc#enable_at_startup'] = 1
g['echodoc#type']= 'virtual'

---------------------MICS--------------------------------
--Navigate buffer vim
map('', '<space>h', '<C-W><C-H>', {silent = true})
map('', '<space>j', '<C-W><C-J>', {silent = true})
map('', '<space>k', '<C-W><C-K>', {silent = true})
map('', '<space>l', '<C-W><C-L>', {silent = true})

opt('o', 'lazyredraw', true)

opt('o', 'ignorecase', true)

opt('o', 'smartcase', true)

opt('o', 'showmode', false)

opt('o', 'clipboard', 'unnamedplus')

--You will have bad experience for diagnostic messages when it's default 4000.
opt('o', 'updatetime', 200)

opt('o', 'laststatus', 2)

opt('o', 'ttyfast', true)

opt('o', 'autoread', true)

opt('o', 'hidden', true)

opt('o', 'cmdheight', 1)

--Solve vim ESC delay
opt('o', 'timeoutlen', 1000)
opt('o', 'ttimeoutlen', 0)

opt('o', 'autoread', true)

opt('w', 'relativenumber', true)

opt('b', 'swapfile', false)

local indent = 2
opt('b', 'shiftwidth', indent)
opt('b', 'tabstop', indent)
opt('b', 'softtabstop', indent)
opt('b', 'expandtab', true)
opt('b', 'autoindent', true)


--Auto remove trailing spaces
cmd([[autocmd BufWritePre * %s/\s\+$//e]])

-- -- highlight yanked text
-- cmd([[au TextYankPost * lua vim.highlight.on_yank {on_visual = false}]]) -- diasbled in visual mode

------------------------------MAP KEYS---------------------------
map('n', '<esc>', ':noh<return><esc>', {noremap = true})
map('n', '<Space><Space>', ':w<CR>')
map('n', 'q', '<Nop>')

----------------------VIM STARTIFY--------------------------------
g.startify_change_to_dir = 0
g.startify_lists = {
       { type = 'sessions',  header = {'   Sessions'}       },
       { type = 'dir',       header = {string.format('    MRU %s', vim.fn.getcwd())} },
       { type = 'bookmarks', header = {'   Bookmarks'}      },
       { type = 'commands',  header = {'   Commands'}       },
}

g.startify_custom_header = {
'',
'',
'    ░░░░░░░░░▄░░░░░░░░░░░░░░▄░░░░           ░░░░░░░░░▄░░░░░░░░░░░░░░▄░░░░',
'    ░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌░░░           ░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌░░░',
'    ░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐░░░           ░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐░░░',
'    ░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐░░░           ░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐░░░',
'    ░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐░░░           ░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐░░░',
'    ░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌░░░           ░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌░░░',
'    ░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌░░           ░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌░░',
'    ░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐░░           ░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐░░',
'    ░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌░           ░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌░',
'    ░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌░           ░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌░',
'    ▀▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐░           ▀▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐░',
'    ▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌           ▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌',
'    ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐░           ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐░',
'    ░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌░           ░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌░',
'    ░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐░░           ░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐░░',
'    ░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌░░           ░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌░░',
'    ░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀░░░           ░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀░░░',
'    ░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀░░░░░           ░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀░░░░░',
'    ░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▀▀░░░░░░░░           ░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▀▀░░░░░░░░',
'',
'',
}
--g.dashboard_custom_shortcut_icon['last_session'] = ' '
--g.dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
--g.dashboard_custom_shortcut_icon['find_file'] = ' '
--g.dashboard_custom_shortcut_icon['new_file'] = ' '
--g.dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
--g.dashboard_custom_shortcut_icon['find_word'] = ' '
--g.dashboard_custom_shortcut_icon['book_marks'] = ' '
