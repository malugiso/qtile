unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

colorscheme ron

" Vim show Whitespaces
" set listchars=tab:│·,eol:¬,trail:·
" set listchars=eol:¬,trail:·
" set list

" change input wait time
set timeoutlen=200 ttimeoutlen=0

" set Numbers and relatives
set number
set relativenumber

" tabs and spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing

"#################### MAPPINGS ####################
" leader is comma
let mapleader=","

" change imput wait time
nnoremap <leader>s :set timeoutlen=1000<CR>
nnoremap <leader>ss :set timeoutlen=200<CR>

" save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader><s-w> :wq<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader><s-q> :q!<cr>

" no highlights
nnoremap <leader><space> :nohlsearch<CR>

" open/closes folds with space
nnoremap <space> za

" buffer management
nnoremap <leader>b :ls<CR>:buffer<Space>

" tab editing
noremap <leader>tn :tabnew<cr>              " new tab
noremap <leader>tc :tabclose<cr>            " close tab
noremap <leader>tm :tabmove
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" faster brackets etc
inoremap <leader><Tab> <Esc>la

" esc with fj
inoremap jk <esc>
vnoremap jk <esc>

" Paste toggle
set pastetoggle=<leader>p                   " set paste mode

" split vim Files
noremap <leader>- :sp <CR>
noremap <leader>\| :vs <CR>
" split navigations like vim navigation
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

" scroll 3 lines at a time
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" open Plugins
noremap <leader>T :NERDTreeToggle<CR>       " nertree toggle
noremap <leader>f :MRU<CR>                  " recently files
noremap <C-p> :Files<CR>                    " ctrl p fzf finder
"noremap <leader>@ :TagbarToggle<CR>         " Tagbar right

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-)

"#################### MAPPING END ####################

" folding settings
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level:

" vim wiki markdown syntax
" let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

" split windows
set splitbelow
set splitright

" some random settings
set showcmd     " shows comands in right bottem bar
"set cursorline  " highlight current line
set wildmenu    " visual autocomplete for command menu
set showmatch   " highlight matching [{()}]
set incsearch   " search as characters are entered
set hlsearch    " highlight matches
"set spell spelllang=en_us " checks spelling

" lightline settings
set laststatus=2    "
set noshowmode      " hide default Mode notification
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head'
\ },
\ }

"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"tmux settings
"set term=screen-256color

"------------------------------------------------------------------------------------------------------------------------------------------------------
"vundle settings
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-syntastic/syntastic'        "Checks Syntax when saveing
Plugin 'vim-scripts/indentpython.vim'   "Auto-Indentation PEP8
Plugin 'scrooloose/nerdtree'            "Explorer left side
Plugin 'jistr/vim-nerdtree-tabs'        "tabing in nerdtree
Plugin 'junegunn/fzf', { 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'          "lightline
Plugin 'mru.vim'                        "recently files open 
Plugin 'tpope/vim-surround'             "souround brackets and stuff
Plugin 'tpope/vim-repeat'               "repeat plugins with dot
Plugin 'scrooloose/nerdcommenter'       "comments
Plugin 'andviro/flake8-vim'             "flake8
Plugin 'tpope/vim-fugitive'             "git function
Plugin 'airblade/vim-gitgutter'         "show git + - 
Plugin 'Townk/vim-autoclose'            "closes brackets and some stuff

" New Plugins
Plugin 'terryma/vim-multiple-cursors'   "Ctr N multiple lines selection
Plugin 'easymotion/vim-easymotion'             "Easy motion


"Plugin 'benmills/vimux'                 "commands from vim with tmux
"Plugin 'majutsushi/tagbar'              "Tagbar
"Plugin 'vimwiki/vimwiki'                "Vim Wiki

" Vim und Tmux zu alt
"Plugin 'christoomey/vim-tmux-navigator' "vim splits and tmux splits seamless
"Plugin 'SirVer/ultisnips'               "Snippets
"Plugin 'valloric/youcompleteme'         "Autocomplete



call vundle#end()
filetype plugin indent on
"------------------------------------------------------------------------------------------------------------------------------------------------------

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"augroup configgroup
"	autocmd!
"	autocmd VimEnter * highlight clear SignColumn
"	autocmd FileType java setlocal noexpandtab
"	autocmd FileType java setlocal formatprg=par\ -w80\ -T4
"	autocmd FileType php setlocal expandtab
"	autocmd FileType php setlocal list
"	autocmd FileType php setlocal formatprg=par\ -w80\ -T4
"	autocmd FileType *.py setlocal tabstop=4
"	autocmd FileType *.py setlocal shiftwidth=4
"	autocmd FileType *.py setlocal softtabstop=4
"	autocmd FileType *.py setlocal textwidth=79
"	autocmd FileType *.py setlocal commentstring=#\ %s
"	autocmd BufEnter *.sh setlocal tabstop=2
"	autocmd BufEnter *.sh setlocal shiftwidth=2
"	autocmd BufEnter *.sh setlocal softtabstop=2
"	autocmd BufEnter *.c setlocal tabstop=2
"	autocmd BufEnter *.c setlocal shiftwidth=2
"	autocmd BufEnter *.c setlocal softtabstop=2
"augroup END

