set ai
set hidden
set icon
set relativenumber
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

" Settings are taken from https://github.com/mitchellh/dotfiles/blob/main/nvim/init.vim
"set wildmode=list:longest     " Wildcard matches show a list, matching the longest first
set wildmode=full     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.swp         " Ignore vim backups

" Backup
set noswapfile

"set list listchars=tab:»\ \,eol:¬,extends:❯,precedes:❮,trail:·
"set list listchars=tab:\|\ ,extends:❯,precedes:❮,trail:·

" activate mouse for normal and visual mode
set mouse=nv

filetype on

au FileType make setlocal noexpandtab

" Some key mappings
inoremap jj <ESC>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Some settings taken from andrewrk
" Moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" I accidentally hit F1 all the time
imap <F1> <Esc>
" nice try, Ex mode
map Q <Nop>
" who uses semicolon anyway?
map ; :
" Toggle paste mode on and off
map <leader>v :setlocal paste!<cr>

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
map <Leader>t :tabedit<CR>
map <Leader>g :ALEGoToDefinition<CR>
map <Leader>u :source ~/.config/nvim/init.vim<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" clear highlighted search
map <Leader>u :<C-u>nohlsearch<CR><C-l>
imap <a-,> <ESC>

let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'rhysd/vim-clang-format'
Plug 'mattn/vim-goimports'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'gabrielelana/vim-markdown'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'ryanoasis/vim-devicons'
Plug 'reedes/vim-pencil'
Plug 'tribela/vim-transparent'

" color schemes
Plug 'jonathanfilip/vim-lucius'
Plug 'chriskempson/base16-vim'

if has('nvim')
  " main one
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  " 9000+ Snippets
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
endif

call plug#end()

set termguicolors
set background=dark
set t_Co=256

try | colorscheme base16-materia | catch | endtry      " use this awesome theme if possible
highlight Pmenu ctermbg=black guibg=black     | " fix popup color so it's easier to read

if has("nvim")
  set inccommand=nosplit                        " show substitutions incrementally
endif

" Misc settings
let g:go_fmt_command = "goimports"
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:coq_settings = { 'auto_start': v:true }
let g:ackprg = 'ag --vimgrep'
let g:go_auto_type_info = 1

" Rust setting
let g:rustfmt_autosave = 1 

" set some ale options
let g:ale_c_parse_compile_commands = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" disable spell checkinf for markdown
let g:markdown_enable_spell_checking = 0

" configure status line style
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set laststatus=2
