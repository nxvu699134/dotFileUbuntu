-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

g.mapleader = ","

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

  -- use {'itchyny/lightline.vim'}
  use {'glepnir/galaxyline.nvim'}

  use {'kyazdani42/nvim-web-devicons'}
  use {'kyazdani42/nvim-tree.lua'}

  use {'junegunn/fzf', run = function() fn['fzf#install']() end}
  use {'junegunn/fzf.vim'}

  use {'mhinz/vim-startify'}

  use {'scrooloose/nerdcommenter'}

  use {'tpope/vim-surround'}

  -- use {'Yggdroot/indentLine'}
  use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}

  use {'airblade/vim-gitgutter'}
  use {'tpope/vim-fugitive'}

  use {'matze/vim-move'}

  use {'wellle/targets.vim'}

  use {'jiangmiao/auto-pairs'}

  use {'nvim-treesitter/nvim-treesitter'}
  -- use {'nvim-treesitter/nvim-treesitter', commit = 'a74da044a8c208177c0af56eeab709859e2fda38'}
  -- use {'nvim-treesitter/nvim-treesitter-angular'}
  --
  -- use{'tree-sitter-typescript/typescript'};
  -- use{'tree-sitter-typescript/tsx'};

  -- use 'neovim/nvim-lspconfig'
  -- use 'glepnir/lspsaga.nvim'
  -- use 'prabirshrestha/vim-lsp'
  -- use 'mattn/vim-lsp-settings'
  -- use 'nvim-lua/completion-nvim'

  use {"neoclide/coc.nvim", branch = "release"}

-- HTML, CSS
  use {'alvan/vim-closetag'}

-- javascript, typescript
  use {'Shougo/echodoc.vim'}
end)

-----------------------COLOR SCHEME-----------------------
cmd 'syntax enable'
cmd([[let $NVIM_TUI_ENABLE_TRUE_COLOR = 1]])
require('colors').apply_colorscheme()

-----------------------LIGHTLINE-----------------------
require('statusline')
-- g.lightline = {
--   colorscheme = 'OldHope',
--   active = {
--     left = {
--       { 'mode', 'paste' },
--       { 'readonly', 'filename', 'modified' }
--     },
--     right = {
--       { 'lineinfo' },
--       { 'filetype' }
--     }
--   },
--   inactive = {
--     left = {
--       {'filename', 'modified'}
--     },
--     right = {
--       {'filetype'}
--     }
--   },
--   separator = { left = '', right = ''},
--   subseparator = { left = '', right = ''},
-- }
-- Use autocmd to force lightline update.
-- cmd([[autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()]])

------------------------NVIM TREE-----------------------
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_follow = 1
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
g.nvim_tree_width_allow_resize  = 1
g.nvim_tree_add_trailing = 1

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["<CR>"]           = tree_cb("edit"),
  ["o"]              = tree_cb("edit"),
  ["v"]              = tree_cb("vsplit"),
  ["s"]              = tree_cb("split"),
  ["<BS>"]           = tree_cb("close_node"),
  ["<S-CR>"]         = tree_cb("close_node"),
  ["I"]              = tree_cb("toggle_ignored"),
  ["H"]              = tree_cb("toggle_dotfiles"),
  ["R"]              = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["d"]              = tree_cb("remove"),
  ["r"]              = tree_cb("rename"),
  ["x"]              = tree_cb("cut"),
  ["c"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["q"]              = tree_cb("close"),
  ["<Nop>"]          = tree_cb("preview"),
  ["<Nop>"]          = tree_cb("prev_git_item"),
  ["<Nop>"]          = tree_cb("next_git_item"),
  ["<Nop>"]          = tree_cb("dir_up"),
  ["<Nop>"]          = tree_cb("full_rename"),
  ["<Nop>"]          = tree_cb("cd"),
  ["<Nop>"]          = tree_cb("tabnew"),
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
  ['fg+'] = {'fg', 'Normal'},
  ['bg+'] = {'bg', 'CursorColumn'},
  ['hl+'] = {'fg', 'Statement'},
  info = {'fg', 'PreProc'},
  -- border =  {'fg', 'Ignore'},
  border =  {'fg', 'Type'},
  prompt =  {'fg', 'WarningMsg'},
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

------------------- TREE-SITTER ---------------------------
local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = {'html', 'css', 'json', 'jsdoc', 'javascript', 'typescript', 'python', 'lua', 'tsx'},
  -- indent = { enable = true },
  highlight = {
    enable = true,
    use_languagetree = true
  }
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
map('n', '<leader>p', ':CocCommand prettier.formatFile<CR>', { noremap = false, silent = false });

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

cmd([[autocmd CursorHold * silent call CocActionAsync('highlight')]])
cmd([[hi CocErrorHighlight guifg=#ff0000 ctermfg=15 gui=bold,undercurl cterm=bold,undercurl]])

-- use this for coc-css
cmd([[autocmd FileType scss setl iskeyword+=@-@]])

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

------------------- ECHO DOC-----------------------------------
g['echodoc#enable_at_startup'] = 1
g['echodoc#type']= 'virtual'

------------------- INDENT LINE-----------------------------------
-- g['indent_blankline_char_highlight_list'] = {'Error', 'Function'}
-- cmd("let g:indent_blankline_space_char_highlight_list = ['Error', 'Function']")
g['indent_blankline_show_current_context'] = true
g['indent_blankline_context_patterns'] = {'class', 'function', 'method', '^if', '^while', '^for', '^object', '^table', 'block', 'arguments', 'element'}
-- cmd([[let g:indent_blankline_use_treesitter = v:true]])

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
opt('o', 'updatetime', 300)

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

-- -- highlight yanked text
-- cmd([[au TextYankPost * lua vim.highlight.on_yank {on_visual = false}]]) -- diasbled in visual mode

------------------------------MAP KEYS---------------------------
map('n', '<esc>', ':noh<return><esc>', {noremap = true})
map('n', '<Space><Space>', ':w<CR>')
map('n', 'q', '<Nop>')

----------------------VIM STARTIFY--------------------------------
g.startify_change_to_dir = 0
g.startify_lists = {
  { type = 'sessions',  header = {'   Sessions'}                  },
  { type = 'dir',       header = {'    MRU ' .. vim.fn.getcwd()} },
  { type = 'bookmarks', header = {'   Bookmarks'}                 },
  { type = 'commands',  header = {'   Commands'}                  },
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
