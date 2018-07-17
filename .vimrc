" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set shell=bash\ --login

"set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif
au BufNewFile,BufRead *.vundle set filetype=vim

" ================ Turn Off Swap Files ==============

"set noswapfile
"set nobackup
"set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
"set smartindent
"set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Auto indent pasted text
"nnoremap p p=`]<C-o>
"nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=marker
"set foldnestmax=3       "deepest fold is 3 levels
"set nofoldenable        "dont fold by default

" ================ Completion =======================

"set wildmode=list:longest
"set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
"set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
"set wildignore+=*vim/backups*
"set wildignore+=*sass-cache*
"set wildignore+=*DS_Store*
"set wildignore+=vendor/rails/**
"set wildignore+=vendor/cache/**
"set wildignore+=*.gem
"set wildignore+=log/**
"set wildignore+=tmp/**
"set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

"et incsearch       " Find the next match as we type the search
"set hlsearch        " Highlight searches by default
"et ignorecase      " Ignore case when searching...
"et smartcase       " ...unless we type a capital

" ================ Custom Settings ========================
"o ~/.yadr/vim/settings.vim

"autocmd BufWinLeave *.* mkview
"utocmd BufWinEnter *.* silent loadview 
"
" go to last place in file
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif

autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja set ft=jinja

call plug#begin('~/.vim/plugged')
"   "
"   "   " Make sure you use single quotes
"   "
"   "   " Shorthand notation; fetches
"   https://github.com/junegunn/vim-easy-align
"   "   Plug 'junegunn/vim-easy-align'
"   "
"   "   " Any valid git URL is allowed
"   "   Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"   "
"   "   " Multiple Plug commands can be written in a single line using |
"   separators
"   "   Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"   "
"   "   " On-demand loading
"   "   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"   "   Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"   "
"   "   " Using a non-master branch
"   "   Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"   "
"   "   " Using a tagged release; wildcard allowed (requires git 1.9.2 or
"   above)
"   "   Plug 'fatih/vim-go', { 'tag': '*' }
"   "
"   "   " Plugin options
"   "   Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"   "
"   "   " Plugin outside ~/.vim/plugged with post-update hook
"   "   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"   "
"   "   " Unmanaged plugin (manually installed and updated)
"   "   Plug '~/my-prototype-plugin'
"   "
"   "   " Initialize plugin system
" put this in your ~/.vimrc, then run :PlugInstall
"Plug 'alcesleo/vim-uppercase-sql'
Plug 'vf42/AutoSQLUpperCase.vim'
Plug 'derekwyatt/vim-scala'
Plug 'lifepillar/pgsql.vim'
call plug#end()

let g:sql_type_default = 'pgsql'


set pastetoggle=<F12>
set textwidth=80

