local function on_attach(clietn, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- Show hover info
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
    -- Jump to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- Jump to references
    vim.keymap.set('n', 'gR', vim.lsp.buf.references, bufopts)
end

require'lspconfig'.elixirls.setup{
    cmd = { "/home/zelzahn/.config/elixir-ls/language_server.sh" };
    on_attach = on_attach;
}

