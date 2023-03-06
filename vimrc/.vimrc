set ai
set hidden
set icon
set showmatch
set showcmd
set incsearch
set ic
set hlsearch
set expandtab
set sw=4
set ts=4
set sts=4
set encoding=utf-8
set clipboard=unnamedplus

" Speed improvements
set synmaxcol=128
syntax sync minlines=256
set lazyredraw

" Settings are taken from https://github.com/mitchellh/dotfiles/blob/main/nvim/init.vim
set wildmode=list:full     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.swp         " Ignore vim backups

" Backup
set noswapfile
set list listchars=tab:\|\ ,extends:❯,precedes:❮,trail:·

" activate mouse for normal and visual mode
set mouse=nv

au FileType make setlocal noexpandtab
au FileType cpp set expandtab
au FileType cpp set sw=4
au FileType cpp set ts=4
au FileType cpp set sts=4
au FileType c set sw=4
au FileType c set ts=4
au FileType c set sts=4
au FileType python setlocal noexpandtab
au FileType python set sw=4
au FileType python set ts=4
au FileType python set sts=4
au FileType html set sw=2
au FileType html set ts=2
au FileType html set sts=2
au FileType javascript set sw=2
au FileType javascript set ts=2
au FileType javascript set sts=2
au FileType markdown set sw=2
au FileType markdown set ts=2
au FileType markdown set sts=2

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.local/share/vim/plugins')
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'catppuccin/vim'
    Plug 'nblock/vim-dokuwiki'

    call plug#end()
endif

filetype plugin on

let mapleader = ","
map <Leader>s :split<cr>
map <Leader>v :vsplit<cr>
map <Leader>w :w<cr>
map <Leader>a :q!<cr>
map <Leader>q :wq<cr>
map <Leader>t :tabedit<CR>
map <Leader>bn :bn<cr>
map <Leader>b :buffers<cr> :buf 
map <Leader>p "+p
map <Leader>y "+y
map <Leader>ftm :set filetype=markdown<cr>
map <Leader>ftd :set filetype=dokuwiki<cr>

" make colors for tmux over ssh sessions looking right
if exists("$TMUX")
    set t_Co=256
    set notermguicolors
else
    set termguicolors
endif

syntax on
set background=light
colorscheme PaperColor

set laststatus=2

set statusline=
set statusline+=[%n]\ %f\ %m\ %r\ %y
set statusline+=%=
set statusline+=\ %5(%l:%v%)
set statusline+=\ %5(%p%%%)

