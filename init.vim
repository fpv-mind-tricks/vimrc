" General Vim settings
set nohlsearch
set number relativenumber
set nowrap
imap jk <esc>
" Set tabs correctly
set cindent
set shiftwidth=2
set expandtab

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
if has("win32")
  " On Windows 
  let g:python3_host_prog  = 'C:/Python34/python.exe'
  " Windows pre plugin setup
  call plug#begin('C:/Temp/Plugins')
  Plug 'dracula/vim'
  Plug 'morhetz/gruvbox'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'tell-k/vim-autopep8'
  Plug 'jremmen/vim-ripgrep'
  Plug 'NLKNguyen/papercolor-theme' " Awsome bright theme
  "" Awsome git frontend
  Plug 'tpope/vim-fugitive'
  Plug 'philip-karlsson/bolt.nvim'
  Plug 'w0rp/ale'

  " Windows plugins
  call plug#end()
  set termguicolors
  " Set the theme
  "" set background=dark 
  "" colorscheme gruvbox
  set background=light 
  colorscheme PaperColor
  " Set the font
  " This is so buggy that I have to map a key to it...
  nnoremap <F3> :GuiFont! DejaVu Sans Mono for Powerline:h8 <CR> 
  " GuiFont! DejaVu Sans Mono for Powerline:h10
  " GuiFont! Hack:h10

  nnoremap <tab> :CtrlPBuffer <CR>

  " Configure ALE
  let g:ale_linters = {'python': ['flake8']}
  " - Python
  let g:ale_python_flake8_executable = 'C:/Python34/python.exe'
  let g:ale_python_flake8_options = '-m flake8'
  " -- C/Cpp
  " Configured using .local.vimrc files

  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
else
  " On mac
  " http://vimr.org/ <-- this seem like a solid alternative to neovim-qt
  " for windows??
  " Mac pre plugins setup
  let g:airline_powerline_fonts = 1
  call plug#begin('~/dev/VimPlugs')

  " Mac plugins
  " The dracula color plugin
  Plug 'dracula/vim'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'rakr/vim-one'
  Plug 'pangloss/vim-javascript'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs'
  Plug 'thinca/vim-localrc'
  Plug 'zchee/deoplete-clang'
  "Plug 'tweekmonster/deoplete-clang2'
  Plug 'rhysd/vim-clang-format'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'jremmen/vim-ripgrep'
  Plug 'maksimr/vim-jsbeautify'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'jceb/vim-orgmode'
  Plug 'tpope/vim-speeddating'
  Plug 'enricobacis/vim-airline-clock'
  Plug 'NLKNguyen/papercolor-theme' " Awsome bright theme
  " TODO: Fix the unimpaired vim plugin for better mappings
  Plug 'philip-karlsson/bolt.nvim'
  Plug 'w0rp/ale'
  Plug 'sebastianmarkow/deoplete-rust'

  call plug#end()

  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
  let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/5.0.0/lib/clang/5.0.0/include/'
  set completeopt-=preview

  " Deoplete for rust
  let g:deoplete#sources#rust#racer_binary='/Users/philipkarlsson/.cargo/bin/racer'
  let g:deoplete#sources#rust#rust_source_path='/Users/philipkarlsson/dev/Rust/src'

  " Configure ALE
  " let g:ale_linters = {'python': ['flake8']}
  let g:ale_linters = {'python': ['flake8'], 'cpp': ['clang']}
  " - Python
  let g:ale_python_flake8_executable = 'python3'
  let g:ale_python_flake8_options = '-m flake8'
  " -- C/Cpp
  " Configured using .local.vimrc files

  if (has("termguicolors"))
    set termguicolors
  endif

  " Set the theme
  set background=light 
  colorscheme PaperColor
  "set background=light
  " let g:airline_theme='atomic'

  nnoremap <c-tab> <tab>
  nnoremap <tab> :CtrlPBuffer <CR>

  autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
endif

" Post plugin initialization settings
nnoremap + :
nnoremap f /
nnoremap F ?
nnoremap å :Tc <CR>
nnoremap ö :Rg <CR>
nnoremap <c-h> :cprevious <CR>
nnoremap <c-l> :cnext <CR>
nnoremap <Space> :set hlsearch! <CR>
let mapleader = ","
