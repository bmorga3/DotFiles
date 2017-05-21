set nocp
" ---------------------------------------------------------------------------- "
" Plug                                                                         "
" ---------------------------------------------------------------------------- "
call plug#begin('~/.vim/plugged')
" Color Schemes
Plug 'nightsense/seabird'
Plug 'nightsense/vim-crunchbang'
Plug 'chriskempson/base16-vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'lu-ren/SerialExperimentsLain'
Plug 'jdkanani/vim-material-theme'
Plug 'altercation/vim-colors-solarized'

" Plug-ins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'ciaranm/detectindent'
Plug 'mhinz/vim-signify'
Plug 'moll/vim-bbye'
Plug 'rhysd/vim-clang-format'

Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

" On-Demand Plug-ins
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' }
Plug 'chiel92/vim-autoformat', { 'on': 'Autoformat' }

Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }

Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': 'cpp' }

" Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }

" Haskell
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }

" LLVM
Plug 'jdevlieghere/llvm.vim', { 'for': 'llvm' }

" Mardown
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Rust
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer --gocode-completer --tern-completer --racer-completer' }

call plug#end()

" ---------------------------------------------------------------------------- "
" Vanilla Vim                                                                  "
" ---------------------------------------------------------------------------- "
" Colors & Syntax
syntax enable                   " Enable syntax highlighting
set termguicolors               " GUI Colors in the terminal
set background=dark             " Dark background color

" Color Scheme
highlight clear SignColumn      " Sing column same background as line numbers
colorscheme space-vim-dark
highlight Pmenu guibg=#7E57C2

" Essentials
filetype plugin indent on       " Enable file type support
set sc                          " showcmd
set smd                         " showmode
set ruler                       " Show ruler
set binary                      " Enable binary support
set hidden                      " Hide buffers
set ttyfast                     " Fast terminal
set autoread                    " Auto reload
set laststatus=2                " Alwasy display statusline
set encoding=utf-8              " UTF-8 encoding
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

" Crypto
set cm=blowfish

" Temp Files
set nobackup                    " No backup file
set noswapfile                  " No swap file

set rnu                        " Relative line numbers
set colorcolumn=80,120         " Show ruler columns

" Cursor Line
set cursorline
set scrolloff=3                 " Keep at least 3 lines above/below
set sidescrolloff=3             " Keep at least 3 lines left/right

" Searching
set hlsearch                    " Highlight matches
set incsearch                   " Incremental search
set smartcase                   " Unless search contains uppercase letter
set showmatch                   " Show matching bracket
set ignorecase                  " Case-insensitive search
vnoremap // y/<C-R>"<CR>        " Search for visual selection

" Indentation
set si                          " SmartIndent
set ai                          " Autoindent
set sr                          " shiftround
set et                          " expandtab
set sta                         " SmartTabs
set ts=4                        " Tabstop
set sw=4                        " shiftwidth
set sts=4                       " softtabstop

" Key sequence timeout
set ttimeout                    " Enable time out
set ttimeoutlen=100             " Set timeout time to 100 ms

" Backspace
set backspace=indent,eol,start  " Delete over line breaks

" Mouse
set mousehide                   " Hide mouse when typing

" Typos
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev Q q
cnoreabbrev Qa qa

" Wrapping
set nowrap                      " No wrapping
highlight clear ColorColumn

" Invisible characters
set nolist                      " Hide by default
nmap <leader>l :set list!<CR>   " Toggle hidden characters
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:⎵,eol:¬

" Completion menu
set completeopt=longest,menuone " Inserts the longest common text and

" Toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Spell checking
set spelllang=en_us             " Default language
set complete+=kspell            " Word completion
map <F7> :setlocal spell!<CR>   " Toggle spell check

" Enable spell checking
autocmd FileType text setlocal spell
autocmd FileType rst setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" Doxygen
autocmd Filetype c,cpp set comments^=:///

" Disable visual bell
set vb t_vb=

" Command Height
set cmdheight=2

" Treat given characters as a word boundary
set iskeyword-=.                " '.' is an end of word designator
set iskeyword-=#                " '#' is an end of word designator

" Wrapping
vmap Q gq                       " Wrap the current visual selection
nmap Q gqap                     " Wrap the current paragraph

" Cycle through buffers with (ctrl) tab
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" Close window
nmap <silent> <Leader>wd <C-w>q " Close the current window

" Splits
set splitright                  " Vertical split right

" Copy/Paste
set clipboard=unnamed           " Use system clip board

" Ctags
set tags=tags;                  " Find tags recursively

" Joining
set nojoinspaces                " Only one space when joining lines
if has('patch-7.3.541')
    set formatoptions+=j        " Remove comment leader when joining lines
endif

" Undo
if has('persistent_undo')
    set undofile                " Persistent undo
    set undodir=~/.vim/undo     " Location to store undo history
    set undolevels=1000         " Max number of changes
    set undoreload=10000        " Max lines to save for undo on a buffer reload
endif

" Recognize NASM extension
au BufRead,BufNewFile *.nasm set filetype=nasm

" Copy filename:linenumber to clipboard
nnoremap <leader>yy :let @+=expand('%:t') . ':' . line(".")<CR>

" Remove Trailing Whitespace
autocmd BufWritePre * :%s/\s\+$//e
" ----------------------------------------------------------------------------"
" Plugin Configuration                                                        "
" ----------------------------------------------------------------------------"

" Close buffer
nnoremap <silent> <Leader>q :Bdelete<CR>
nnoremap <silent> <Leader>bd :Bdelete!<CR>

" Signify
let g:signify_vcs_list = [ 'git', 'hg', 'svn' ]

" FZF
let g:fzf_buffers_jump=1
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
vnoremap ag y :Ag <C-R>"<CR>

" Airline
let g:airline_theme="violet"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" Detect Indent
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_indent=2
let g:detectindent_preferred_expandtab=1

" Tagbar
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_right=1
let g:tagbar_width=35
let g:tagbar_autofocus=0

" NERDTree
let g:NERDTreeIgnore=['\.job$', '^CVS$', '\.orig', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeStatusline="%f"
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=35
nnoremap <F9> :NERDTreeFind<CR>
nnoremap <F10> :NERDTreeToggle<CR>

" Close vim if the only window left is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist=['~/.vim/*']
let g:ycm_auto_trigger=1
let g:ycm_enable_diagnostic_signs=1
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_show_diagnostics_ui=1
let g:ycm_max_diagnostics_to_display=15
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 0
let g:ycm_always_populate_location_list = 0
let g:ycm_open_loclist_on_ycm_diags=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_min_num_identifier_candidate_chars=0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist={
            \ 'vim' : 1,
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'md' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1
            \}

" YouCompleteMe Omni-Completion
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" YouCompleteMe key bindings
nnoremap <F12> :YcmDiags<CR>
nnoremap <F11> :YcmForceCompileAndDiagnostics<CR>

" YcmCompleter Subcommands
nnoremap <silent> <Leader>yd :YcmCompleter GetDoc<CR>
nnoremap <silent> <Leader>yf :YcmCompleter FixIt<CR>
nnoremap <silent> <Leader>yg :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>yt :YcmCompleter GetType<CR>
nnoremap <silent> <Leader>yi :YcmCompleter GoToInclude<CR>

" AutoFormat
let g:formatdef_clangformat='"clang-format -style=file"'

" Doxygen
let g:DoxygenToolkit_commentType = "C++"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

" Syntastic Checkers
let g:syntastic_cpp_checkers=['gcc']
let g:syntastic_python_checkers=['pylint']
let g:syntastic_javascript_checkers = ['jshint']

" Dispatch
nnoremap <F5> :Make<CR>
nnoremap <C-n> :Tagbar<CR>
nnoremap <C-x> :NERDTreeToggle<CR>

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

if has("gui_running")
    set noeb
    set vb t_vb

    set guioptions-=L
    set guioptions-=r

    set lines=30
    set columns=100

    set linespace=2
    set guifont=Source\ Code\ Pro:h16
endif
