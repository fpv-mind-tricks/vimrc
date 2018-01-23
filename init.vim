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
  " Windows pre plugin setup
  call plug#begin('C:/Temp/Plugins')
  Plug 'dracula/vim'
  Plug 'morhetz/gruvbox'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-syntastic/syntastic'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'tell-k/vim-autopep8'
  Plug 'jremmen/vim-ripgrep'
  Plug 'NLKNguyen/papercolor-theme' " Awsome bright theme
  "" Awsome git frontend
  Plug 'tpope/vim-fugitive'

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

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 0
  "let g:syntastic_check_on_wq = 0
  let g:syntastic_enable_signs = 1
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_cpp_checkers = ["clang_tidy"]
  let g:syntastic_python_checkers = ['flake8']
  let g:syntastic_python_flake8_exec = 'py'
  let g:syntastic_python_flake8_args = ['-3', '-m', 'flake8']
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
  Plug 'vim-syntastic/syntastic'
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
  Plug 'philip-karlsson/vim-tc-explorer'

  call plug#end()

  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
  let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/5.0.0/lib/clang/5.0.0/include/'
  set completeopt-=preview

  if (has("termguicolors"))
    set termguicolors
  endif

  " Set the theme
  set background=light 
  colorscheme PaperColor
  "set background=light
  " let g:airline_theme='atomic'

  nnoremap <tab> :CtrlPBuffer <CR>

  " syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 0
  "let g:syntastic_check_on_wq = 0
  let g:syntastic_enable_signs = 1
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_cpp_checkers = ["clang_tidy"]

  autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
endif

" Post plugin initialization settings
nnoremap + :
nnoremap f /
nnoremap F ?
nnoremap ä :SyntasticCheck <CR>
nnoremap <Space> :set hlsearch! <CR>
let mapleader = ","
