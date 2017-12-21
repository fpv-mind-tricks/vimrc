" General Vim settings
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
Plug 'tweekmonster/deoplete-clang2'
Plug 'rhysd/vim-clang-format'
Plug 'vim-syntastic/syntastic'

" Initialize plugin system
call plug#end()

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Set the theme
colorscheme one
set background=light
let g:airline_theme='atomic'

if (has("termguicolors"))
	set termguicolors
endif

nnoremap <tab> :CtrlPBuffer <CR>
nnoremap <CR> :

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_cpp_checkers = ["clang_tidy"]

