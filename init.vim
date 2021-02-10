" set t_Co=256
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
  Plugin 'itchyny/lightline.vim'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'Yggdroot/indentLine'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'matze/vim-move'
  Plugin 'mhinz/vim-startify'
  Plugin 'MattesGroeger/vim-bookmarks'
  Plugin 'neoclide/coc.nvim', {'branch': 'release'}
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'wellle/targets.vim'
  " Plugin 'iamcco/markdown-preview.nvim'

  " GUI theme
  " Plugin 'tyrannicaltoucan/vim-quantum'
  Plugin 'tyrannicaltoucan/vim-deep-space'

  " GIT vim
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'

  " javascript, typescript
  Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
  Plugin 'pangloss/vim-javascript'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'alvan/vim-closetag'
  Plugin 'othree/javascript-libraries-syntax.vim'
  Plugin 'othree/yajs.vim'
  Plugin 'othree/html5.vim'
  Plugin 'HerringtonDarkholme/yats.vim'
  Plugin 'Shougo/echodoc.vim'
  Plugin 'heavenshell/vim-jsdoc'
  Plugin 'cakebaker/scss-syntax.vim'

  "Angular
  Plugin 'burnettk/vim-angular'

  " React
  " Plugin 'peitalin/vim-jsx-typescript'
  Plugin 'mxw/vim-jsx'
  Plugin 'MaxMEllon/vim-jsx-pretty'

  "Vuejs
  Plugin 'posva/vim-vue'

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
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" "Close preview window when completion is done.
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jr <Plug>(coc-references)
nmap <silent> <leader>ji <Plug>(coc-implementation)
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>f  <Plug>(coc-fix-current)
nmap <silent> <leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" let g:coc_status_error_sign = '✘ Error'
" let g:coc_status_warning_sign = '⚠ Warning'
let g:coc_status_error_sign = ''
let g:coc_status_warning_sign = ' '
" let g:coc_status_hint_sign = ''
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"==================================================
"                   NERD TREE
"==================================================
map <silent> <leader>ls <ESC>:NERDTreeToggle<CR>
map <silent> <leader>lf :NERDTreeFind<CR>
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
"
" hide status line of fzf window
" if has('nvim') && !exists('g:fzf_layout')
"   autocmd! FileType fzf
"   autocmd  FileType fzf set laststatus=0 noshowmode noruler
"     \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" endif
"==================================================
"                 PRETTIER
"==================================================
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#single_quote = 'true'

"==================================================
"                 VIM AIRLINE
"==================================================
" let g:airline_powerline_fonts = 1
" " let g:airline#extensions#coc#enabled = 1
" let g:airline_section_c = '%f'
" " let g:airline_theme='luna'
" let g:airline_theme='deep_space'
" " Update section z to just have line number
" let g:airline_section_z = airline#section#create(['linenr'])
" " Do not draw separators for empty sections (only for the active window) >
" let g:airline_skip_empty_sections = 1
" " Custom setup that removes filetype/whitespace from default vim airline bar
" let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
" " Enable caching of syntax highlighting groups
" let g:airline_highlighting_cache = 1
" " Don't show git changes to current file in airline
" let g:airline#extensions#hunks#enabled=0

"========================================================
" CONFIG LIGHTLINE
"========================================================
let g:lightline = {
      \ 'colorscheme': 'deepspace',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right':[ ['lineinfo'],
      \             [ 'cocstatus', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'readonly': 'LightlineReadonly',
      \ },
      \ 'component_expand': {
      \   'cocstatus': 'LightlineCocStatus',
      \ },
      \ 'component_type': {
      \   'cocstatus': 'error',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"}
  \ }

let g:lightline.inactive = {
		  \ 'left': [ [ 'filename', 'modified' ] ],
		  \ 'right': [ [ 'filetype' ] ]
      \}

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let icon = (strlen(&filetype) ? ' ' . WebDevIconsGetFileTypeSymbol() : '')
  " return join([icon, filename],'  ')
  return join([filename, icon], '')
endfunction

function! LightlineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "🔐"
    else
        return ""
    endif
endfunction

function! LightlineCocStatus() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, '⛔️ '. info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, '🚸 '. info['warning'])
  endif
  return join(msgs, ' ')
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" autocmd BufWritePost * call lightline#update()
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

function! s:custom_deep_colors() abort
  " coc.nvim color changes
  hi CocErrorHighlight guifg=#ff0000 ctermfg=15
  hi CocHighlightText guibg=#2c3a41 ctermbg=242 gui=bold,undercurl cterm=bold,undercurl
endfunction

autocmd! ColorScheme quantum call s:custom_quantum_colors()
autocmd! ColorScheme deep-space call s:custom_deep_colors()

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

" let g:quantum_italics=1
" colorscheme quantum

let g:deepspace_italics=1
colorscheme deep-space

" ============Navigate buffer vim ============
map <silent> <space>h <C-W><C-H>
map <silent> <space>j <C-W><C-J>
map <silent> <space>k <C-W><C-K>
map <silent> <space>l <C-W><C-L>
" map <silent> <space>H <C-W>H
" map <silent> <space>J <C-W>J
" map <silent> <space>K <C-W>K
" map <silent> <space>L <C-W>L
nnoremap <esc> :noh<return><esc>
map <Space><Space> :w<CR>

filetype plugin indent on
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
set lazyredraw
set noswapfile
set noshowmode " Don't dispay mode in command line (airilne already shows it)
set updatetime=200 "Diagnostic messages default 4000.
" set nonumber
set relativenumber
set laststatus=2
set ttyfast

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"
" TextEdit might fail if hidden is not set.
set hidden

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

" Zoom in zoom out vim pane
noremap zi <c-w>_ \| <c-w>\|
noremap zo <c-w>=

"disable recording
map q <Nop>

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e
" hi Normal ctermbg=none

" === echodoc === "
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1
let g:echodoc#type='virtual'
" let g:echodoc#type='floating'

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,jquery,angularjs,angularui,angularuirouter,react'
let g:yats_host_keyword = 1


"=== vim-close-tag=== "
" let g:closetag_filetypes = 'html,xhtml,phtml,tsx,jsx'
" let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx'

" ==================== STARTIFY ==================================
let g:startify_change_to_dir = 0
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_custom_header = [
      \'      ______             ___                _                 ______             _    _______ _                    ______ _                             ',
      \'     (_____ \           / __)          _   (_)               / _____)           | |  (_______) |          _       / _____) |                            ',
      \'      _____) )___  ____| |__ ____ ____| |_  _  ___  ____    | /  ___  ___   ____| |   _      | | _   ____| |_    | /     | | _   ____ ____   ____  ____ ',
      \'     |  ____/ _  )/ ___)  __) _  ) ___)  _)| |/ _ \|  _ \   | | (___)/ _ \ / _  | |  | |     | || \ / _  |  _)   | |     | || \ / _  |  _ \ / _  |/ _  )',
      \'     | |   ( (/ /| |   | | ( (/ ( (___| |__| | |_| | | | |  | \____/| |_| ( ( | | |  | |_____| | | ( ( | | |__   | \_____| | | ( ( | | | | ( ( | ( (/ / ',
      \'     |_|    \____)_|   |_|  \____)____)\___)_|\___/|_| |_|   \_____/ \___/ \_||_|_|   \______)_| |_|\_||_|\___)   \______)_| |_|\_||_|_| |_|\_|| |\____)',
      \'                                                                                                                                           (_____|      ',
      \'       ______                ______ _                            ______                                 ______                _                         ',
      \'      / _____)              / _____) |                          / _____)                       _       / _____)     _        | |                        ',
      \'     | /      ____ ____    | /     | | _   ____  ___  ____     | /      ____ ____  ____   ___ | |_    | /      ____| |_  ____| | _                      ',
      \'     | |     / _  |  _ \   | |     | || \ / _  |/___)/ _  )    | |     / _  |  _ \|  _ \ / _ \|  _)   | |     / _  |  _)/ ___) || \                     ',
      \'     | \____( ( | | | | |  | \_____| | | ( ( | |___ ( (/ / _   | \____( ( | | | | | | | | |_| | |__   | \____( ( | | |_( (___| | | |                    ',
      \'      \______)_||_|_| |_|   \______)_| |_|\_||_(___/ \____| )   \______)_||_|_| |_|_| |_|\___/ \___)   \______)_||_|\___)____)_| |_|                    ',
      \'                                                          |/                                                                                            ',
\]

