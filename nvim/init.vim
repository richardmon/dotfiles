call plug#begin('~/.local/share/nvim/plugged')
""" Latex
Plug 'lervag/vimtex', {'for': 'latex' }

""" PHP
Plug 'dsawardekar/wordpress.vim' , {'for': 'php'}
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}

""" Typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}


""" Theme
Plug 'chriskempson/base16-vim'

""" Python
Plug 'psf/black' , {'for': 'python'}
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}

""" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}

""" General
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'janko/vim-test'
Plug 'airblade/vim-gitgutter'
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
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary='/home/richard/.cargo/bin/racer'
" }}}
" Test {{{
let test#strategy = {
\ 'nearest': 'neovim',
\ 'file': 'dispatch',
\ 'suite': 'basic'
\}

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
" }}}
" ALE {{{
  let g:ale_fixers = {
  \   'javascript': [
  \       'prettier',
  \   ],
  \   'typescript': [
  \       'prettier',
  \   ],
  \   'rust': [
  \       'rustfmt',
  \   ]
  \}
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)
" }}}
"Custom Functions{{{
"}}}
" Ack {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}
" Tagbar {{{
nmap <F5> :TagbarToggle<CR>
" }}}
" Ctrlp {{{
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" }}}
