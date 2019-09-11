call plug#begin('~/.local/share/nvim/plugged')
""" Latex
Plug 'lervag/vimtex', {'for': 'latex' }

""" PHP
Plug 'dsawardekar/wordpress.vim' , {'for': 'php'}
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}

""" Theme
Plug 'chriskempson/base16-vim'

""" Python
Plug 'psf/black' , {'for': 'python'}
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}

""" General
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-vinegar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
"Terminal{{{
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
" Ack {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}
