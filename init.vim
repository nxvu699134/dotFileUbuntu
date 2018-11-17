set t_Co=256
set laststatus=2
set nu
set clipboard=unnamed
let mapleader = ","
set nocompatible

set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " General
  Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plugin 'junegunn/fzf.vim'
  Plugin 'w0rp/ale'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-surround'
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tomtom/tcomment_vim'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'mbbill/undotree'
  Plugin 'Yggdroot/indentLine'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'srcery-colors/srcery-vim'
  Plugin 'matze/vim-move'
  Plugin 'ludovicchabant/vim-gutentags'
  Plugin 'skywind3000/gutentags_plus'
  Plugin 'misterbuckley/vim-definitive'
  Plugin 'tpope/vim-endwise'

  " GIT vim
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'

  " javascript
  "Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
  "Plugin 'pangloss/vim-javascript'
  "Plugin 'mxw/vim-jsx'
  "Plugin 'ternjs/tern_for_vim', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
  "Plugin 'janko-m/vim-test'
  "Plugin 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }

  " Ruby
  " Plugin 'vim-ruby/vim-ruby'
  " Plugin 'fishbullet/deoplete-ruby'
  " Plugin 'tpope/vim-rails'
  " Plugin 'Keithbsmiley/rspec.vim'

" After all plugins...
call vundle#end()

filetype plugin indent on

set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent

nnoremap <esc> :noh<return><esc>

" ============Navigate buffer vim ============
map <silent> <space>h <C-W><C-H>
map <silent> <space>j <C-W><C-J>
map <silent> <space>k <C-W><C-K>
map <silent> <space>l <C-W><C-L>

" ============== NERD TREE ==============
map <silent> <leader>ls <ESC>:NERDTreeToggle<CR>
map <silent> <leader>rev :NERDTreeFind<CR>
let NERDTreeMapOpenSplit = 's'
let NERDTreeMapOpenVSplit = 'v'

" ================FZF=================
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore node_modules -l -g ""'
map <c-p> <ESC>:Files<CR>
map <leader>ag <ESC>:Ag<CR>


" =============== Color scheme =================
colorscheme srcery
let g:srcery_inverse_matches = 1
let g:srcery_inverse_match_paren = 1
let g:srcery_dim_lisp_paren = 1

" ============ YCM config===========
" Start autocompletion after 4 chars
" let g:ycm_min_num_of_chars_for_completion = 4
" let g:ycm_min_num_identifier_candidate_chars = 4
" let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0

"============Prettier config==========
" let g:prettier#autoformat = 0
" let g:prettier#exec_cmd_async = 1


" =========== Vim airline theme =========
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

" ===========ALE config===============
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_echo_msg_error_str = '✘ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
let g:ale_list_window_size = 5
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_fixers = {
\   'javascript': [
\       'prettier',
\       'eslint',
\   ],
\   'ruby': ['rubocop']
\}
let g:javascript_plugin_flow = 1
autocmd BufWritePost *.js,*.jsx,*.py,*.rb ALEFix
autocmd FileType ruby compiler ruby
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>en :ALENextWrap<cr>
nnoremap <leader>ep :ALEPreviousWrap<cr>

"============Easy motion============
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <silent> <tab> <Plug>(easymotion-overwin-w)

" ==============Vim test ===============
" map <Leader>tf :TestFile<CR>
" map <Leader>tn :TestNearest<CR>
" map <Leader>tl :TestLast<CR>
" map <Leader>ts :TestSuite<CR>
" Rpsec config
" let test#ruby#rspec#executable = 'rspec'
" Jest config
" let g:test#javascript#jest#file_pattern = '.*\.spec\.js'
" let test#strategy = 'neovim'

"===============Vim easytags==============
" let g:easytags_async = 1
" let g:easytags_always_enabled = 1

"===============Vim fugitive =============
set diffopt+=vertical
map <Leader>gb :Gblame<CR>

"===============Vim definitive=============
nnoremap <Leader>d :vsplit <bar> :FindDefinition<CR>
let g:definitive_definitions = {
    \ 'javascript.jsx': { 'extends': 'javascript' }
    \}
let g:definitive_root_markers = {
      \ 'all': [ '.git', '.gitignore', '.hg', '.hgignore', 'Makefile' ],
      \ 'javascript': [ 'node_modules' ]
      \}

"===============Config MISC ===============
" auto pair
let g:AutoPairsMultilineClose = 0
" vim move
let g:move_key_modifier = 'C'
" vim undotree
map <silent> <leader>u :UndotreeToggle<CR>
syntax on
" Solve vim ESC delay
set timeoutlen=1000 ttimeoutlen=0
" Relative line numbers
set number relativenumber
map <Space><Space> :w<CR>
nnoremap yp :let @+ = expand("%")<cr>
