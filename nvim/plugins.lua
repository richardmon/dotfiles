local iron = require('iron')
iron.core.set_config {
  preferred = {
    python = "ipython",
    clojure = "lein",
    prolog = "swipl"
  }
}

local treesitter = require('nvim-treesitter.configs')
treesitter.setup {
    highlight = {
      enable = true,
    },
    incremental_selection = {
        enable = true,
    },
    indent = {
        enable = true
    }
}



--local nvim_lsp = require('lspconfig')
--local lsp_completion = require("completion")

----Enable completion
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true


--local on_attach = function(client, bufnr)
--  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

--  -- Mappings.
--  local opts = { noremap=true, silent=true }
--  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

--  -- Set some keybinds conditional on server capabilities
--  if client.resolved_capabilities.document_formatting then
--    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--  elseif client.resolved_capabilities.document_range_formatting then
--    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
--  end

--  -- Set autocommands conditional on server_capabilities
--  if client.resolved_capabilities.document_highlight then
--    vim.api.nvim_exec([[
--      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
--      augroup lsp_document_highlight
--        autocmd! * <buffer>
--        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--      augroup END
--    ]], false)
--  end

--  -- Setup autocompletion if available
--  if client.resolved_capabilities.completion then
--    lsp_completion.on_attach(client, bufnr)
--  end


--end

---- Use a loop to conveniently both setup defined servers 
---- and map buffer local keybindings when the language server attaches
--local servers = { "pyright", "rust_analyzer", "tsserver"}
--for _, lsp in ipairs(servers) do
--  nvim_lsp[lsp].setup {
--      on_attach = on_attach
--  }
--end


--nvim_lsp.sumneko_lua.setup {
--    on_attach = on_attach,
--    cmd = {"/home/richard/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/richard/lua-language-server/main.lua"},
--    settings = {
--    Lua = {
--      runtime = {
--        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--        version = 'LuaJIT',
--        -- Setup your lua path
--        path = vim.split(package.path, ';'),
--      },
--      diagnostics = {
--        -- Get the language server to recognize the `vim` global
--        globals = {'vim'},
--      },
--      workspace = {
--        -- Make the server aware of Neovim runtime files
--        library = {
--          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--        },
--      },
--      -- Do not send telemetry data containing a randomized but unique identifier
--      telemetry = {
--        enable = false,
--      },
--    },
--  },
--}

--vim.g.completion_chain_complete_list = {
--    default = {
--        default = {
--            {complete_items = {'lsp'}},
--            {complete_items = {'buffers'}}
--        },
--        -- tex = {
--        --     {complete_items = {'vimtex', 'lsp'}}
--        -- },
--        comment = {
--            {complete_items = {'buffers'}}
--        },
--        string = {
--            {complete_items = {'path'}}
--        },
--    }
--}

