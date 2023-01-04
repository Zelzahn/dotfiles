vim.g.limelight_conceal_ctermfg = 'gray'
vim.g.limelight_conceal_ctermfg = 240

vim.mkdp_auto_close = 0

vim.cmd('let g:lightline = {"colorscheme": "onedark"}')

vim.cmd.colorscheme "catppuccin-macchiato"

vim.g.vimtex_view_method = 'zathura'

vim.g.python3_host_prog = '~/.asdf/installs/python/3.10.9/bin/python'

require'lspconfig'.elixirls.setup{
    cmd = { "/home/zelzahn/.config/elixir-ls/language_server.sh" };
}
