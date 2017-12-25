" General Vim settings
set nohlsearch
set number relativenumber
set nowrap
imap jk <esc>
let g:airline_powerline_fonts = 1
" Set tabs correctly
set cindent
set shiftwidth=2
set expandtab

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
if has("win32")
	" On Windows 
	call plug#begin('C:/Temp/Plugins')
else
	" On mac
	call plug#begin('~/dev/VimPlugs')
endif

" The dracula color plugin
Plug 'dracula/vim'
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

" Initialize plugin system
call plug#end()

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/5.0.0/lib/clang/5.0.0/include/'


if (has("termguicolors"))
	set termguicolors
endif

" Set the theme
colorscheme dracula
"set background=light
let g:airline_theme='atomic'

nnoremap <tab> :CtrlPBuffer <CR>
nnoremap + :
nnoremap f /
nnoremap F ?
nnoremap <Space> :set hlsearch! <CR>

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
