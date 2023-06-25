-- local function on_attach(clietn, bufnr)
--     local bufopts = { noremap = true, silent = true, buffer = bufnr }
--     -- Show hover info
--     vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
--     -- Jump to definition
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--     -- Jump to references
--     vim.keymap.set('n', 'gR', vim.lsp.buf.references, bufopts)
-- end
-- 
-- require'lspconfig'.elixirls.setup{
--     cmd = { "/home/zelzahn/.config/elixir-ls/language_server.sh" };
--     on_attach = on_attach;
-- }

local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup {
  credo = {
    -- port = 9000, -- connect via TCP with the given port. mutually exclusive with `cmd`
    -- cmd = "path/to/credo-language-server", -- path to the executable. mutually exclusive with `port`
    version = "0.1.3", -- version of credo-language-server to install and use. defaults to 0.0.5
    on_attach = function(client, bufnr)
      -- custom keybinds
    end
  },
  elixirls = {
    -- specify a repository and branch
    -- repo = "mhanberg/elixir-ls", -- defaults to elixir-lsp/elixir-ls
    -- branch = "mh/all-workspace-symbols", -- defaults to nil, just checkouts out the default branch, mutually exclusive with the `tag` option
    -- tag = "v0.14.6", -- defaults to nil, mutually exclusive with the `branch` option

    -- alternatively, point to an existing elixir-ls installation (optional)
    -- not currently supported by elixirls, but can be a table if you wish to pass other args `{"path/to/elixirls", "--foo"}`
    -- cmd = "/home/zelzahn/.config/elixir-ls/language_server.sh",

    -- default settings, use the `settings` function to override settings
    settings = elixirls.settings {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = false,
      suggestSpecs = false,
    },
    on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      -- Show hover info
      vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
      -- Jump to definition
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      -- Jump to references
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", bufopts)
      vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", bufopts)
      vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", bufopts)
    end
  }
}

