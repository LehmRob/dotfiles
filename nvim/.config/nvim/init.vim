set ai
set hidden
set icon
set relativenumber
set number
set showmatch
set showcmd
set incsearch
set ic
set hlsearch
set expandtab
set colorcolumn=100
set sw=4
set ts=4
set sts=4
set encoding=utf-8
set clipboard=unnamedplus

" Speed improvements
set synmaxcol=128
syntax sync minlines=256
set lazyredraw

" Backup
set undofile
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set backup
set noswapfile

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·

au FileType make setlocal noexpandtab
au FileType cpp set expandtab
au FileType cpp set sw=4
au FileType cpp set ts=4
au FileType cpp set sts=4
au FileType c set sw=4
au FileType c set ts=4
au FileType c set sts=4
au FileType c ClangFormatAutoDisable
au FileType python set sw=4
au FileType python set ts=4
au FileType python set sts=4
au FileType python setlocal noexpandtab

filetype indent on

" Some key mappings
inoremap jk <ESC>


let mapleader = ","
map <Leader>s :split<cr>
map <Leader>v :vsplit<cr>
map <Leader>w <C-w>w
map <Leader>a :q!<cr>
map <Leader>s :w<cr>
map <Leader>q :wq<cr>
map <Leader>t :tabedit<space>
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>ct :!ctags-exuberant -R -f .tags --exclude=.git --exclude=build .<CR>
map <Leader>f :Files<CR>
map <Leader>l :Lines<CR>
map <Leader>b :Buffers<CR>
imap <a-,> <ESC>

let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'rhysd/vim-clang-format'
Plug 'rking/ag.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" color schemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'andreypopp/vim-colors-plain'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
call plug#end()

set background=light

" Misc settings
let g:go_fmt_command = "goimports"
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:deoplete#enable_at_startup = 1

set laststatus=2
