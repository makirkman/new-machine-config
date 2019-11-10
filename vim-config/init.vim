"-- Plugins --"
" plugin directory
call plug#begin('~/.local/share/nvim/plugged')

" put plugins in here, with single quotes "
" onedark color theme
Plug 'joshdick/onedark.vim'

" horizon color theme
Plug 'ntk148v/vim-horizon'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" add status bar to bottom of screen
Plug 'itchyny/lightline.vim'

" git integration
Plug 'tpope/vim-fugitive'

" tldr plugin
Plug 'wlemuel/vim-tldr'

call plug#end()

"-- Colour Themes --"
set termguicolors
syntax on
colorscheme horizon
let g:onedark_terminal_italics=1

"-- Lightline Configuration --"
" ('colorscheme': 'onedark' for onedark

let g:lightline = {
	\ 'colorscheme': 'onedark',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\	      [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'fugitive#head'
	\ },
	\}

"-- Cursor Configuration --"
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
:au VimLeave * set guicursor=a:hor25-blinkon10

"-- Mouse Configuration --"
:set mouse=a
