" Platform specific preconds
if has("win32")
  let g:python3_host_prog  = 'C:/Python36/python.exe'
  call plug#begin('C:/Temp/Plugins')
elseif has("macunix")
  call plug#begin('~/dev/VimPlugs')
else
  let g:python3_host_prog  = 'python3'
  call plug#begin('~/dev/VimPlugs')
endif

" Install common plugins
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
"Plug 'zchee/deoplete-clang'
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
" MOST IMPORTANT PLUGIN EVER :)
Plug 'philip-karlsson/bolt.nvim'
Plug 'philip-karlsson/midi.nvim'
Plug 'w0rp/ale'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'Shougo/neoinclude.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'mfukar/robotframework-vim'
Plug 'cohlin/vim-colorschemes'
Plug 'aklt/plantuml-syntax'
Plug 'sgeb/vim-diff-fold'

" Install platform specific plugins
if has("win32")
elseif has("macunix")
else
endif

" Finalize plugin installation
call plug#end()

" Platform independent plugin settings
nnoremap <c-tab> <tab>
nnoremap <tab> :CtrlPBuffer <CR>

" Platform specific settings/hacks/workarounds
if has("win32")
  nnoremap <F3> :GuiFont! DejaVu Sans Mono for Powerline:h10 <CR> 
  " Configure ALE
  let g:ale_linters = {'python': ['flake8']}
  " - Python
  let g:ale_python_flake8_executable = 'C:/Python34/python.exe'
  let g:ale_python_flake8_options = '-m flake8'
  " -- C/Cpp
  " Configured using .local.vimrc files
  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
  " Only load clang when dotfile
  let g:clang_load_if_clang_dotfile = 1
elseif has("macunix")
  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
  let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/5.0.0/lib/clang/5.0.0/include/'
  set completeopt-=preview

  " Deoplete for rust
  let g:deoplete#sources#rust#racer_binary='/Users/philipkarlsson/.cargo/bin/racer'
  let g:deoplete#sources#rust#rust_source_path='/Users/philipkarlsson/dev/Rust/src'

  " Configure ALE
  let g:ale_linters = {'python': ['flake8'], 'cpp': ['clang']}
  " - Python
  let g:ale_python_flake8_executable = 'python3'
  let g:ale_python_flake8_options = '-m flake8'
  " -- C/Cpp
  " Configured using .local.vimrc files
  autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
else
  " To be done
endif

" Manage GUI settings
if has("win32")
  set termguicolors
  set background=light 
  colorscheme PaperColor
  let g:airline_theme = "bubblegum"
elseif has("mac") || has("macunix")
    " shall not be used when working in terminal 
    " set termguicolors
    set background=light 
    colorscheme PaperColor
    let g:airline_theme = "bubblegum"
else
  set background=light
  colorscheme PaperColor
  let g:airline_theme = "bubblegum"
endif

" General Vim settings (platform and GUI independent)
set nohlsearch
set number relativenumber
set nowrap
imap jk <esc>
" Set tabs correctly
set cindent
set shiftwidth=2
set expandtab

" Post plugin initialization settings
nnoremap + :
map f <Plug>(incsearch-forward)
" nnoremap f /
nnoremap F ?
nnoremap å :Tc <CR>
nnoremap Å :TcCwd <CR>
" More correct as 'ö' is what : 
" corresponds to on a US keyboard
nnoremap ö :
nnoremap ä :
nnoremap <c-h> :cprevious <CR>
nnoremap <c-l> :cnext <CR>
nnoremap <Space> :set hlsearch! <CR>
let mapleader = ","
" Jump to tag: / c-t goes backwards
nnoremap t <C-]>
nnoremap T :tnext <CR>
