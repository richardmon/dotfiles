call plug#begin('~/.local/share/nvim/plugged')
""" Latex
Plug 'lervag/vimtex', {'for': ['plaintex', 'tex']}

""" PHP
Plug 'dsawardekar/wordpress.vim' , {'for': 'php'}
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}

""" Typescript
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'typescript'}

""" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

""" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

""" Theme
Plug 'morhetz/gruvbox'

""" Python
Plug 'ehamberg/vim-cute-python', {'for': 'python'}
Plug 'bps/vim-textobj-python', {'for': 'python'}

""" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}

""" General
Plug 'ap/vim-css-color'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'janko/vim-test'
Plug 'kana/vim-textobj-user'
Plug 'hkupty/iron.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update


""" Motion 🚅
Plug 'yuttie/comfortable-motion.vim'
Plug 'haya14busa/incsearch.vim'


""" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

""" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }



call plug#end()
"General Conf{{{
syntax on
set termguicolors
set nowrap
set noswapfile " Disable swap file creation

highlight Comment cterm=italic gui=italic
"}}}
" Tabs {{{
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
nnoremap nt :tabnew<Cr>
"}}}
"UI config {{{
" colorscheme base16-default-dark
let g:gruvbox_italic=1
colorscheme gruvbox

set number relativenumber
set showcmd
set cursorline
filetype indent on
set showmatch
let &colorcolumn="80,".join(range(120,999),",")
"}}}
"Folds{{{
set foldenable
set foldmethod=marker
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
"Custom Functions{{{
hi TabLine    gui=NONE guibg=#3e4452 guifg=#abb2bf    cterm=NONE term=NONE ctermfg=black ctermbg=white
let g:tablineclosebutton=1

"}}}
" Markdown {{{
let g:mkdp_browser = 'firefox'
" }}}
" FZF {{{
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-p><C-b> :Buffers<CR>
" }}}
" IncSearch {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}
" Lua {{{
luafile $HOME/.config/nvim/plugins.lua
" }}}
" LSP {{{
set completeopt=menuone,noinsert,noselect
" }}}
