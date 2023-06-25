vim.g.limelight_conceal_ctermfg = 'gray'
vim.g.limelight_conceal_ctermfg = 240

vim.mkdp_auto_close = 0

vim.cmd('let g:lightline = {"colorscheme": "catppuccin"}')

vim.cmd.colorscheme "catppuccin-macchiato"

vim.g.vimtex_view_method = 'zathura'

vim.g.python3_host_prog = '~/.asdf/installs/python/3.10.9/bin/python'

vim.g["rnvimr_enable_picker"] = 1 -- Make Ranger to be hidden after picking a file

-- Set notify as the default notification manager
vim.notify = require("notify")
