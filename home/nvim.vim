set termguicolors
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
set sw=4
set ts=4
set sts=4
set expandtab

" Backup
set undofile
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set backup
set noswapfile

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:•
set ruler
set colorcolumn=90

autocmd FileType make setlocal noexpandtab
"autocmd FileType c ClangFormatAutoEnable
autocmd FileType c++ ClangFormatAutoEnable
filetype indent on

let mapleader = ","
map <Leader>s :split<cr>
map <Leader>v :vsplit<cr>
map <Leader>w <C-w>w
map <Leader>a :q!<cr>
map <Leader>s :w<cr>
map <Leader>q :wq<cr>
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>t :tabedit<space>
map <Leader>b :buffers<CR>:buffer<Space>
imap <a-,> <ESC>

call plug#begin('~/.local/share/nvim/plugged')
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'rhysd/vim-clang-format'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'
call plug#end()
set background=light
colorscheme PaperColor 

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Misc settings
let g:go_fmt_command = "goimports"
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
