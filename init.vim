call plug#begin('~/.local/share/nvim/plugged')
Plug 'lervag/vimtex', {'for': 'latex' }
Plug 'chriskempson/base16-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-vinegar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
call plug#end()
"General Conf{{{
syntax on
filetype plugin on
set termguicolors
colorscheme base16-default-dark
" Tabs {{{
set tabstop=4
set softtabstop=4
set expandtab
nnoremap nt :tabnew<Cr>
"}}}
"UI config {{{
set number
set showcmd
set cursorline
filetype indent on
set showmatch
let &colorcolumn="80,".join(range(120,999),",")
"}}}
"Searching{{{
set incsearch
set hlsearch
"}}}
"Folds{{{
set foldenable
set foldmethod=marker
"}}}

"}}}
"Movment{{{
nmap gl <C-w>l
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
"}}}
"Termianl{{{
tnoremap <Esc> <C-\><C-n> 
nnoremap ot :terminal<Cr>
"}}}
"Vimtex{{{
let g:vimtex_compiler_progname = 'nvr'
"}}}
" Ultisnips  {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}
"Custom Functions{{{
"}}}
