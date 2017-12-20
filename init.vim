" General Vim settings
set number relativenumber
set nowrap
imap jk <esc>
let g:airline_powerline_fonts = 1
" Set tabs correctly
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

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
