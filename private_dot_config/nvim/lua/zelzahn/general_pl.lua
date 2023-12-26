vim.g.limelight_conceal_ctermfg = 'gray'
vim.g.limelight_conceal_ctermfg = 240

vim.mkdp_auto_close = 0

vim.cmd('let g:lightline = {"colorscheme": "catppuccin"}')

vim.cmd.colorscheme "catppuccin-macchiato"

vim.g.tex_flavor = 'latex'
vim.g.vimtex_compiler_method = 'tectonic'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = 'abdmg'

vim.g.python3_host_prog = '~/.asdf/installs/python/3.10.9/bin/python'

vim.g["rnvimr_enable_picker"] = 1 -- Make Ranger to be hidden after picking a file

-- Set notify as the default notification manager
vim.notify = require("notify")

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

require("Comment").setup()

