call plug#begin('~/.local/share/nvim/plugged')
""" Latex
Plug 'lervag/vimtex', {'for': ['plaintex', 'tex']}


""" Typescript
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'pantharshit00/vim-prisma'
Plug 'prettier/vim-prettier'

""" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

""" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

""" Theme
Plug 'morhetz/gruvbox'
" Plug 'vim-airline/vim-airline'

""" Python
Plug 'psf/black' , {'for': 'python'}

""" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}

"""Graphql
Plug 'jparise/vim-graphql', { 'for': 'javascript' }


""" General
Plug 'ap/vim-css-color'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'

""" CMP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'


""" Snippets
Plug 'L3MON4D3/LuaSnip' " Snippets plugin
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp


""" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

call plug#end()
"General Conf{{{
syntax on
let mapleader = ";"
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
nnoremap nt :tabnew<CR>
"}}}
"UI config {{{
let g:gruvbox_italic=1
colorscheme gruvbox
set number relativenumber
set showcmd
set cursorline
filetype indent on
set showmatch
let &colorcolumn="80,".join(range(120,999),",")

hi ColorColumn ctermbg=darkgrey guibg=grey

" set guifont=Monospace:h11
" set guifont=FiraCode\ NF:h14.5
set guifont=Iosevka\ Term:h12
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
" Ultisnips  {{{
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" }}}
" Snippets {{{
lua require("luasnip.loaders.from_vscode").load({ paths = { "./friendly-snippets" } }) -- Load snippets from my-snippets folder
" lua require("luasnip.loaders.from_vscode").lazy_load()
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
" }}}
" Comments {{{
lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

EOF
" }}}
"Custom Functions{{{
hi TabLine    gui=NONE guibg=#3e4452 guifg=#abb2bf    cterm=NONE term=NONE ctermfg=black ctermbg=white
let g:tablineclosebutton=1
"}}}
" Markdown {{{
let g:mkdp_browser = 'firefox'
" }}}
" Airline {{{
" let g:airline#extensions#tabline#enabled = 1
" }}}
" Javascript {{{
au BufNewFile,BufRead *.ejs set filetype=html
" }}}
" LSP {{{
lua << EOF
-- LSP Keybindigs
--   Buffer
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent=false})
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true}) 
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true} ) 
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true})


--  Diagnostics
vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lD', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
EOF

lua << EOF
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'prismals', 'tailwindcss' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'cmdline' }
  },
  experimental = {
    native_menu = false,
    ghost_text = true
  },
}
EOF
" }}}
" Telescope {{{
nnoremap <C-p><C-p> <cmd>Telescope find_files<cr>
nnoremap <C-p><C-g> <cmd>Telescope live_grep<cr>
nnoremap <C-p><C-b> <cmd>Telescope buffers<cr>
nnoremap <C-p><C-h> <cmd>Telescope help_tags<cr>
lua << EOF
vim.api.nvim_set_keymap('n', '<leader>ca', "<cmd>lua  require('telescope.builtin').lsp_code_actions( {layout_config={width=50, height=20} } ) <CR>", {noremap = true, silent=false})
EOF
" }}}
" Statusline {{{
lua << END
require('lualine').setup{
  options = { theme = 'gruvbox' }
}
END
" }}}
