local iron = require('iron')

-- iron.core.add_repl_definitions {
--   python = {
--     mycustom = {
--       command = {"mycmd"}
--     }
--   },
--   clojure = {
--     lein_connect = {
--       command = {"lein", "repl", ":connect"}
--     }
--   }
-- }

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

-- require'nvim-treesitter.configs'.setup {
--   highlight = {
--     enable = true,
--     custom_captures = {
--       -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
--       ["foo.bar"] = "Identifier",
--     },
--   },
-- }
