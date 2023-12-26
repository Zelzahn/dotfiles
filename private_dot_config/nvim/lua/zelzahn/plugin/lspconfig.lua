local function on_attach(client, buffer)
    local keymap_opts = { buffer = buffer }
    -- Show hover info
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
    -- Jump to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- Jump to references
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    -- Code navigation and shortcuts
    vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)
    vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
    vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
    vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
    vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, keymap_opts)

    -- Show diagnostic popup on cursor hover
    local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
      end,
      group = diag_float_grp,
    })

    -- Goto previous/next diagnostic warning/error
    vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, keymap_opts)
    vim.keymap.set("n", "g]", vim.diagnostic.goto_next, keymap_opts)
end

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- add this for ufo
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
local lspconf = require("lspconfig")

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
--     on_attach = on_attach
-- }

lspconf["rust_analyzer"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconf["elixirls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = ({ suggestSpecs = true }),
    cmd = { "/home/zelzahn/.config/ls/elixir-ls/language_server.sh" }
})

lspconf["gopls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconf["typst_lsp"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconf["ccls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconf['ltex'].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "ltex-ls" },
  filetypes = { "markdown", "text", "tex" },
  flags = { debounce_text_changes = 300 },
  settings ={
      ltex = {
        language='auto',
        languageToolHttpServerUri='https://api.languagetoolplus.com/',
        languageToolOrg = {
          username='friedrich@friedrichvdb.be',
          apiKey = 'pit-sVtMrkq4AfwY',
        }
      }
    }
})

