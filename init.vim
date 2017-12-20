" General Vim settings
set number relativenumber
imap jk <esc>

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
if has("win32")
	" On Windows 
	call plug#begin('C:/Temp/Plugins')
else
	" On mac
	call plug#begin('mac path here')
endif

" Make sure you use single quotes

" Initialize plugin system
call plug#end()
