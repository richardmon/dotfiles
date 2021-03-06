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
Plug 'twinside/vim-haskellconceal', {'for': 'haskell'}

""" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

""" Theme
Plug 'morhetz/gruvbox'

""" Python
Plug 'psf/black' , {'for': 'python', 'tag': '19.10b0'}
Plug 'ehamberg/vim-cute-python', {'for': 'python'}
Plug 'bps/vim-textobj-python', {'for': 'python'}

""" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}

""" General
Plug 'ap/vim-css-color'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'janko/vim-test'
Plug 'kana/vim-textobj-user'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'hkupty/iron.nvim'
Plug 'mattn/emmet-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

""" Snippets
Plug 'honza/vim-snippets'
" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'
" React code snippets
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'




""" Motion 🚅
Plug 'yuttie/comfortable-motion.vim'
Plug 'haya14busa/incsearch.vim'

" Plug 'taigacute/spaceline.vim'
" Plug 'ryanoasis/vim-devicons'

""" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}

""" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

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
"Python{{{
" let g:python3_host_prog = '/home/richard/.venvs/neovim_python/bin/python3'
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
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
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
" Tagbar {{{
nmap <F5> :TagbarToggle<CR>
let g:tagbar_type_elm = {
      \ 'kinds' : [
      \ 'f:function:0:0',
      \ 'm:modules:0:0',
      \ 'i:imports:1:0',
      \ 't:types:1:0',
      \ 'a:type aliases:0:0',
      \ 'c:type constructors:0:0',
      \ 'p:ports:0:0',
      \ 's:functions:0:0',
      \ ]
      \}
let g:tagbar_type_haskell = {
            \ 'ctagsbin'    : 'hasktags',
            \ 'ctagsargs'   : '-x -c -o-',
            \ 'kinds'       : [
                \  'm:modules:0:1',
                \  'd:data:0:1',
                \  'd_gadt:data gadt:0:1',
                \  'nt:newtype:0:1',
                \  'c:classes:0:1',
                \  'i:instances:0:1',
                \  'cons:constructors:0:1',
                \  'c_gadt:constructor gadt:0:1',
                \  'c_a:constructor accessors:1:1',
                \  't:type names:0:1',
                \  'pt:pattern types:0:1',
                \  'pi:pattern implementations:0:1',
                \  'ft:function types:0:1',
                \  'fi:function implementations:0:1',
                \  'o:others:0:1'
            \ ],
            \ 'sro'          : '.',
            \ 'kind2scope'   : {
        \ 'm'        : 'module',
        \ 'd'        : 'data',
        \ 'd_gadt'   : 'd_gadt',
        \ 'c_gadt'   : 'c_gadt',
        \ 'nt'       : 'newtype',
        \ 'cons'     : 'cons',
        \ 'c_a'      : 'accessor',
        \ 'c'        : 'class',
        \ 'i'        : 'instance'
    \ },
    \ 'scope2kind'   : {
        \ 'module'   : 'm',
        \ 'data'     : 'd',
        \ 'newtype'  : 'nt',
        \ 'cons'     : 'c_a',
        \ 'd_gadt'   : 'c_gadt',
        \ 'class'    : 'ft',
        \ 'instance' : 'ft'
    \ }
\ }
" }}}
"GutenTags {{{
let g:gutentags_file_list_command = 'rg --files'
" }}}
" Coc.nvim {{{
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
xmap <F8>  <Plug>(coc-format-selected)
nmap <F8>  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-r> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-space>a <Plug>(coc-range-select)
xmap <silent> <C-space>a <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

""" Prettier {{{
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"}}}

" }}}
" Markdown {{{
let g:mkdp_browser = 'firefox'
" }}}
" Spacebar {{{
" let g:spaceline_seperate_style= 'arrow-fade'
" }}}
" FZF {{{
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-p><C-b> :Buffers<CR>
nnoremap <C-p><C-l> :Lines<CR>
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

" Iron {{
luafile $HOME/.config/nvim/plugins.lua
" }}
