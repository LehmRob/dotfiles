set ai
set hidden
set icon
set relativenumber
"set nonu 
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
au FileType c ClangFormatAutoDisable
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

filetype plugin on

" Some key mappings
inoremap jj <ESC>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let mapleader = ","
map <Leader>s :split<cr>
map <Leader>v :vsplit<cr>
map <Leader>w :w<cr>
map <Leader>a :q!<cr>
map <Leader>q :wq<cr>
map <Leader>m :make<cr>
map <Leader>p :!cmake --build build<CR>
map <Leader>B :!cmake --build build<CR>
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>f :Files<CR>
map <Leader>u :MundoToggle
map <Leader>l :Lines<CR>
map <Leader>b :Buffers<CR>
map <Leader>t :tabedit<CR>
map <Leader>g :ALEGoToDefinition<CR>
map <Leader>u :source ~/.config/nvim/init.vim<CR>

" clear highlighted search
map <Leader>u :<C-u>nohlsearch<CR><C-l>
imap <a-,> <ESC>

let g:python3_host_prog = '/usr/bin/python3'

if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'rhysd/vim-clang-format'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'simnalamburt/vim-mundo'
Plug 'morhetz/gruvbox'

" color schemes
Plug 'jonathanfilip/vim-lucius'

call plug#end()

set termguicolors
set background=dark

try | colorscheme gruvbox | catch | endtry      " use this awesome theme if possible
highlight Pmenu ctermbg=black guibg=black     | " fix popup color so it's easier to read

if has("nvim")
  set inccommand=nosplit " show substitutions incrementally
endif

" Misc settings
let g:go_fmt_command = "goimports"
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:coq_settings = { 'auto_start': v:true }
let g:ackprg = 'ag --vimgrep'

" set some ale options
let g:ale_c_parse_compile_commands = 1

" activate editorconfig
let g:EditorConfig_core_mode = 'external_command'

" configure status line style
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set laststatus=2
