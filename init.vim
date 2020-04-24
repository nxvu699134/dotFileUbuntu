" set t_Co=256
set laststatus=2
set nu
set clipboard=unnamedplus
let mapleader = ","
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
  Plugin 'neoclide/coc.nvim', {'branch': 'release'}
  Plugin 'Xuyuanp/nerdtree-git-plugin'

  " GUI theme
  " Plugin 'srcery-colors/srcery-vim'
  Plugin 'mhartington/oceanic-next'
  Plugin 'rakr/vim-one'
  Plugin 'tyrannicaltoucan/vim-quantum'

  " GIT vim
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'

  " javascript, typescript
  Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
  Plugin 'pangloss/vim-javascript'
  Plugin 'burnettk/vim-angular'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'alvan/vim-closetag'
  Plugin 'othree/javascript-libraries-syntax.vim'
  Plugin 'othree/yajs.vim'
  Plugin 'othree/html5.vim'
  Plugin 'HerringtonDarkholme/yats.vim'
  Plugin 'Shougo/echodoc.vim'
  Plugin 'heavenshell/vim-jsdoc'

" After all plugins...
call vundle#end()


"==================================================
"                 COC NVIM
"==================================================
" if hidden is not set, TextEdit might fail.
set hidden

" Only one line for command line
set cmdheight=1

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

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

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto refresh tree when save file
" autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
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
nmap <leader>ag <ESC>:Ag<CR>

" hide status line of fzf window
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif
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
" let g:airline#extensions#coc#enabled = 1
let g:airline_section_c = '%t'
let g:airline_theme='luna'
" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])
" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1
" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1
" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0
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

" =============== Color scheme =================
"highlight red all trailing space
" function! TrailingSpaceHighlights() abort
"   " Hightlight trailing whitespace
"   highlight Trail ctermbg=red guibg=red
"   call matchadd('Trail', '\s\+$', 100)
" endfunction
" autocmd! ColorScheme * call TrailingSpaceHighlights()

function! s:custom_quantum_colors() abort
  " coc.nvim color changes
  hi link CocErrorSign WarningMsg
  hi link CocWarningSign Number
  hi link CocInfoSign Type
  hi CocErrorHighlight guifg=#ff0000 ctermfg=15
  hi CocHighlightText guibg=#2c3a41 ctermbg=242 gui=bold,undercurl cterm=bold,undercurl

  "priority current line nerdtree
  if has('guirunning') || has('termguicolors')
    let cursorline_gui=''
    let cursorline_cterm='ctermfg=white'
  else
    let cursorline_gui='guifg=white'
    let cursorline_cterm=''
  endif
  exec 'hi CursorLine ' . cursorline_gui . ' ' . cursorline_cterm
endfunction
autocmd! ColorScheme quantum call s:custom_quantum_colors()

function! s:custom_one_colors() abort
  call one#highlight('CocErrorHighlight', 'ff0000', '', 'bold,underline')
  call one#highlight('CocHighlightText', '', '', 'underline')
endfunction
autocmd! ColorScheme one call s:custom_one_colors()

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

" let g:one_allow_italics=1
" colorscheme one

let g:quantum_italics=1
colorscheme quantum

" ============Navigate buffer vim ============
map <silent> <space>h <C-W><C-H>
map <silent> <space>j <C-W><C-J>
map <silent> <space>k <C-W><C-K>
map <silent> <space>l <C-W><C-L>
nnoremap <esc> :noh<return><esc>
map <Space><Space> :w<CR>

filetype plugin indent on
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent

" Automatically re-read file if a change was detected outside of vim
set autoread
" auto pair
let g:AutoPairsMultilineClose = 0

" vim move
let g:move_key_modifier = 'C'

" Solve vim ESC delay
set timeoutlen=1000 ttimeoutlen=0

"Get path of current file
nnoremap yp :let @+ = expand("%")<cr>

" set background terminal trans, use this when srcery scheme
" hi Normal ctermbg=none
set lazyredraw

" === echodoc === "
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1
let g:echodoc#type='virtual'

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,jquery,angularjs,angularui,angularuirouter'
let g:yats_host_keyword = 1
set noswapfile
syntax on

" Don't dispay mode in command line (airilne already shows it)
set noshowmode
set nonumber

" Zoom in zoom out vim pane
noremap zi <c-w>_ \| <c-w>\|
noremap zo <c-w>=

"disable recording
map q <Nop>

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

" ==================== STARTIFY ==================================
let g:startify_change_to_dir = 0
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_custom_header = [
\' ▄████▄   ▒█████  ▓█████▄ ▓█████     █     █░ ██░ ██  ▄▄▄     ▄▄▄█████▓   ▓██   ██▓ ▒█████   █    ██     ██▓     ▒█████   ██▒   █▓▓█████',
\'▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀    ▓█░ █ ░█░▓██░ ██▒▒████▄   ▓  ██▒ ▓▒    ▒██  ██▒▒██▒  ██▒ ██  ▓██▒   ▓██▒    ▒██▒  ██▒▓██░   █▒▓█   ▀',
\'▒▓█    ▄ ▒██░  ██▒░██   █▌▒███      ▒█░ █ ░█ ▒██▀▀██░▒██  ▀█▄ ▒ ▓██░ ▒░     ▒██ ██░▒██░  ██▒▓██  ▒██░   ▒██░    ▒██░  ██▒ ▓██  █▒░▒███',
\'▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄    ░█░ █ ░█ ░▓█ ░██ ░██▄▄▄▄██░ ▓██▓ ░      ░ ▐██▓░▒██   ██░▓▓█  ░██░   ▒██░    ▒██   ██░  ▒██ █░░▒▓█  ▄',
\'▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒   ░░██▒██▓ ░▓█▒░██▓ ▓█   ▓██▒ ▒██▒ ░      ░ ██▒▓░░ ████▓▒░▒▒█████▓    ░██████▒░ ████▓▒░   ▒▀█░  ░▒████▒ ██▓',
\'░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░   ░ ▓░▒ ▒   ▒ ░░▒░▒ ▒▒   ▓▒█░ ▒ ░░         ██▒▒▒ ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒    ░ ▒░▓  ░░ ▒░▒░▒░    ░ ▐░  ░░ ▒░ ░ ▒▓▒',
\'░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░     ▒ ░ ░   ▒ ░▒░ ░  ▒   ▒▒ ░   ░          ▓██ ░▒░   ░ ▒ ▒░ ░░▒░ ░ ░    ░ ░ ▒  ░  ░ ▒ ▒░    ░ ░░   ░ ░  ░ ░▒',
\'░                  ░                                                       ░ ░                                                ░            ░',
\' ██▓     ▒█████   ██▒   █▓▓█████     █     █░ ██░ ██  ▄▄▄     ▄▄▄█████▓   ▓██   ██▓ ▒█████   █    ██     ▄████▄   ▒█████  ▓█████▄ ▓█████',
\'▓██▒    ▒██▒  ██▒▓██░   █▒▓█   ▀    ▓█░ █ ░█░▓██░ ██▒▒████▄   ▓  ██▒ ▓▒    ▒██  ██▒▒██▒  ██▒ ██  ▓██▒   ▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀',
\'▒██░    ▒██░  ██▒ ▓██  █▒░▒███      ▒█░ █ ░█ ▒██▀▀██░▒██  ▀█▄ ▒ ▓██░ ▒░     ▒██ ██░▒██░  ██▒▓██  ▒██░   ▒▓█    ▄ ▒██░  ██▒░██   █▌▒███',
\'▒██░    ▒██   ██░  ▒██ █░░▒▓█  ▄    ░█░ █ ░█ ░▓█ ░██ ░██▄▄▄▄██░ ▓██▓ ░      ░ ▐██▓░▒██   ██░▓▓█  ░██░   ▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄',
\'░██████▒░ ████▓▒░   ▒▀█░  ░▒████▒   ░░██▒██▓ ░▓█▒░██▓ ▓█   ▓██▒ ▒██▒ ░      ░ ██▒▓░░ ████▓▒░▒▒█████▓    ▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒ ██▓',
\'░ ▒░▓  ░░ ▒░▒░▒░    ░ ▐░  ░░ ▒░ ░   ░ ▓░▒ ▒   ▒ ░░▒░▒ ▒▒   ▓▒█░ ▒ ░░         ██▒▒▒ ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒    ░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░ ▒▓▒',
\'░ ░ ▒  ░  ░ ▒ ▒░    ░ ░░   ░ ░  ░     ▒ ░ ░   ▒ ░▒░ ░  ▒   ▒▒ ░   ░        ▓██ ░▒░   ░ ▒ ▒░ ░░▒░ ░ ░      ░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░ ░▒',
\'░ ░   ░ ░ ░ ▒       ░░     ░        ░   ░   ░  ░░ ░  ░   ▒    ░          ▒ ▒ ░░  ░ ░ ░ ▒   ░░░ ░ ░    ░        ░ ░ ░ ▒   ░ ░  ░    ░    ░',
\]
