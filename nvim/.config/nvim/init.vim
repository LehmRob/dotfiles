set ai
set hidden
set icon
"set relativenumber
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
"set undofile
"set undodir=~/.vim/tmp/undo//
"set backupdir=~/.vim/tmp/backup//
"set backup
set noswapfile

"set list listchars=tab:»\ \,eol:¬,extends:❯,precedes:❮,trail:·
set list listchars=tab:\|\ ,eol:¬,extends:❯,precedes:❮,trail:·

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
au FileType c ClangFormatAutoDisable
au FileType python setlocal noexpandtab
au FileType python set sw=4
au FileType python set ts=4
au FileType python set sts=4

filetype indent on

" Some key mappings
inoremap jj <ESC>

let mapleader = ","
map <Leader>s :split<cr>
map <Leader>v :vsplit<cr>
map <Leader>w :w<cr>
map <Leader>a :q!<cr>
map <Leader>q :wq<cr>
map <Leader>m :make<cr>
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>f :Files<CR>
map <Leader>l :Lines<CR>
map <Leader>b :Buffers<CR>
map <Leader>t :tabedit<CR>
map <Leader>cf :ClangFormat<CR>
map <Leader>u :source ~/.config/nvim/init.vim<CR>

" clear highlighted search
map <Leader>u :<C-u>nohlsearch<CR><C-l>
imap <a-,> <ESC>

let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'rhysd/vim-clang-format'
Plug 'rking/ag.vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'

" color schemes
Plug 'andreypopp/vim-colors-plain'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
call plug#end()

colorscheme dracula
set termguicolors
set background=dark
set t_Co=256

" Misc settings
let g:go_fmt_command = "goimports"
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:deoplete#enable_at_startup = 1

" LSP settings

" ccls
lua << EOF
local lspconfig = require'lspconfig'
lspconfig.ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}
EOF

" gopls
lua << EOF
require 'lspconfig'.gopls.setup{}
EOF


" Status line settings are inspired by
" https://gabri.me/blog/diy-vim-statusline
" :h mode() to see all modes
let g:currentmode={
    \ 'n'      : 'N ',
    \ 'no'     : 'N·Operator Pending ',
    \ 'v'      : 'V ',
    \ 'V'      : 'V·Line ',
    \ '\<C-V>' : 'V·Block ',
    \ 's'      : 'Select ',
    \ 'S'      : 'S·Line ',
    \ '\<C-S>' : 'S·Block ',
    \ 'i'      : 'I ',
    \ 'R'      : 'R ',
    \ 'Rv'     : 'V·Replace ',
    \ 'c'      : 'Command ',
    \ 'cv'     : 'Vim Ex ',
    \ 'ce'     : 'Ex ',
    \ 'r'      : 'Prompt ',
    \ 'rm'     : 'More ',
    \ 'r?'     : 'Confirm ',
    \ '!'      : 'Shell ',
    \ 't'      : 'Terminal '
    \}

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif
  if bytes <= 0
    return '0'
  endif
  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

set laststatus=2
set statusline=
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%0*\ [%n]                                " buffernr
set statusline+=%0*\ %{GitInfo()}                        " Git Branch name
set statusline+=%0*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%0*\ %=                                  " Space
set statusline+=%0*\ %y\                                 " FileType
set statusline+=%0*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%0*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
