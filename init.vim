set nocompatible
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " General
  Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plugin 'junegunn/fzf.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'tpope/vim-surround'
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'mbbill/undotree'
  Plugin 'Yggdroot/indentLine'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'matze/vim-move'
  Plugin 'mhinz/vim-startify'
  Plugin 'tpope/vim-endwise'
  Plugin 'MattesGroeger/vim-bookmarks'

  " GUI theme
  Plugin 'srcery-colors/srcery-vim'

  " GIT vim
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'

  " javascript
  Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
  Plugin 'pangloss/vim-javascript'
  Plugin 'burnettk/vim-angular'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'alvan/vim-closetag'
  Plugin 'neoclide/coc.nvim', {'branch': 'release'}
  Plugin 'othree/javascript-libraries-syntax.vim'
  Plugin 'othree/yajs.vim'
  Plugin 'othree/html5.vim'
  Plugin 'HerringtonDarkholme/yats.vim'

" After all plugins...
call vundle#end()


"==================================================
"                 COC NVIM
"==================================================
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" "Close preview window when completion is done.
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jr <Plug>(coc-references)
nmap <silent> <leader>ji <Plug>(coc-implementation)
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>f  <Plug>(coc-fix-current)
nmap <silent> <leader>sd :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_status_error_sign = '✘ Error'
let g:coc_status_warning_sign = '⚠ Warning'
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"==================================================
"                   NERD TREE 
"==================================================
map <silent> <leader>ls <ESC>:NERDTreeToggle<CR>
map <silent> <leader>rev :NERDTreeFind<CR>
let g:NERDTreeMapMenu='M'
let NERDTreeMapOpenSplit = 's'
let NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeIgnore=['\~$', 'node_modules']

"==================================================
"                NERD COMMENTER
"==================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"==================================================
"                     FZF
"==================================================
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore node_modules -l -g ""'
map <c-p> <ESC>:Files<CR>
map <leader>ag <ESC>:Ag<CR>

"==================================================
"                 PRETTIER
"==================================================
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#single_quote = 'true'

"==================================================
"                 VIM AIRLINE
"==================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_section_c = '%t'

"==================================================
"                 EASY MOTION
"==================================================
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <silent> <tab> <Plug>(easymotion-overwin-w)

"==================================================
"                 VIM FUGITIVE
"==================================================
set diffopt+=vertical
map <Leader>gb :Gblame<CR>

"==================================================
"                 Config MISC
"==================================================
set t_Co=256
set laststatus=2
set nu
set clipboard=unnamedplus
let mapleader = ","
syntax on

" =============== Color scheme =================
colorscheme srcery
let g:srcery_inverse_matches = 1
let g:srcery_inverse_match_paren = 1
let g:srcery_dim_lisp_paren = 1

" ============Navigate buffer vim ============
map <silent> <space>h <C-W><C-H>
map <silent> <space>j <C-W><C-J>
map <silent> <space>k <C-W><C-K>
map <silent> <space>l <C-W><C-L>
nnoremap <esc> :noh<return><esc>
map <Space><Space> :w<CR>

filetype plugin indent on
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent

" auto pair
let g:AutoPairsMultilineClose = 0

" vim move
let g:move_key_modifier = 'C'

" Solve vim ESC delay
set timeoutlen=1000 ttimeoutlen=0

" Relative line numbers
set number relativenumber

"Get path of current file
nnoremap yp :let @+ = expand("%")<cr>

" set background terminal trans
hi Normal ctermbg=none
set lazyredraw

" ==================== STARTIFY ==================================
let g:startify_change_to_dir = 0
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_custom_header = [
\' ▄████▄   ▒█████  ▓█████▄ ▓█████     █     █░ ██░ ██  ▄▄▄     ▄▄▄█████▓   ▓██   ██▓ ▒█████   █    ██     ██▓     ▒█████   ██▒   █▓▓█████      ', 
\'▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀    ▓█░ █ ░█░▓██░ ██▒▒████▄   ▓  ██▒ ▓▒    ▒██  ██▒▒██▒  ██▒ ██  ▓██▒   ▓██▒    ▒██▒  ██▒▓██░   █▒▓█   ▀      ',
\'▒▓█    ▄ ▒██░  ██▒░██   █▌▒███      ▒█░ █ ░█ ▒██▀▀██░▒██  ▀█▄ ▒ ▓██░ ▒░     ▒██ ██░▒██░  ██▒▓██  ▒██░   ▒██░    ▒██░  ██▒ ▓██  █▒░▒███        ',
\'▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄    ░█░ █ ░█ ░▓█ ░██ ░██▄▄▄▄██░ ▓██▓ ░      ░ ▐██▓░▒██   ██░▓▓█  ░██░   ▒██░    ▒██   ██░  ▒██ █░░▒▓█  ▄      ',
\'▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒   ░░██▒██▓ ░▓█▒░██▓ ▓█   ▓██▒ ▒██▒ ░      ░ ██▒▓░░ ████▓▒░▒▒█████▓    ░██████▒░ ████▓▒░   ▒▀█░  ░▒████▒ ██▓ ',
\'░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░   ░ ▓░▒ ▒   ▒ ░░▒░▒ ▒▒   ▓▒█░ ▒ ░░         ██▒▒▒ ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒    ░ ▒░▓  ░░ ▒░▒░▒░    ░ ▐░  ░░ ▒░ ░ ▒▓▒ ',
\'░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░     ▒ ░ ░   ▒ ░▒░ ░  ▒   ▒▒ ░   ░          ▓██ ░▒░   ░ ▒ ▒░ ░░▒░ ░ ░    ░ ░ ▒  ░  ░ ▒ ▒░    ░ ░░   ░ ░  ░ ░▒    ',
\'░                  ░                                                       ░ ░                                                ░            ░  ',
\' ██▓     ▒█████   ██▒   █▓▓█████     █     █░ ██░ ██  ▄▄▄     ▄▄▄█████▓   ▓██   ██▓ ▒█████   █    ██     ▄████▄   ▒█████  ▓█████▄ ▓█████       ',
\'▓██▒    ▒██▒  ██▒▓██░   █▒▓█   ▀    ▓█░ █ ░█░▓██░ ██▒▒████▄   ▓  ██▒ ▓▒    ▒██  ██▒▒██▒  ██▒ ██  ▓██▒   ▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀      ',
\'▒██░    ▒██░  ██▒ ▓██  █▒░▒███      ▒█░ █ ░█ ▒██▀▀██░▒██  ▀█▄ ▒ ▓██░ ▒░     ▒██ ██░▒██░  ██▒▓██  ▒██░   ▒▓█    ▄ ▒██░  ██▒░██   █▌▒███        ',
\'▒██░    ▒██   ██░  ▒██ █░░▒▓█  ▄    ░█░ █ ░█ ░▓█ ░██ ░██▄▄▄▄██░ ▓██▓ ░      ░ ▐██▓░▒██   ██░▓▓█  ░██░   ▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄      ',
\'░██████▒░ ████▓▒░   ▒▀█░  ░▒████▒   ░░██▒██▓ ░▓█▒░██▓ ▓█   ▓██▒ ▒██▒ ░      ░ ██▒▓░░ ████▓▒░▒▒█████▓    ▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒ ██▓ ',
\'░ ▒░▓  ░░ ▒░▒░▒░    ░ ▐░  ░░ ▒░ ░   ░ ▓░▒ ▒   ▒ ░░▒░▒ ▒▒   ▓▒█░ ▒ ░░         ██▒▒▒ ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒    ░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░ ▒▓▒ ',
\'░ ░ ▒  ░  ░ ▒ ▒░    ░ ░░   ░ ░  ░     ▒ ░ ░   ▒ ░▒░ ░  ▒   ▒▒ ░   ░        ▓██ ░▒░   ░ ▒ ▒░ ░░▒░ ░ ░      ░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░ ░▒  ',
\'░ ░   ░ ░ ░ ▒       ░░     ░        ░   ░   ░  ░░ ░  ░   ▒    ░          ▒ ▒ ░░  ░ ░ ░ ▒   ░░░ ░ ░    ░        ░ ░ ░ ▒   ░ ░  ░    ░    ░     ',
\]
