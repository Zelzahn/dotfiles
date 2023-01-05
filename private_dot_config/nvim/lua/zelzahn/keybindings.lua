-- function! CheckBackspace() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction

-- Set mapleader to spacebar
vim.keymap.set("n", "<space>", "<nop>", { noremap = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope git_files<CR>')

-- Ranger
-- Old
-- let g:ranger_map_keys = 0
-- map <leader>f :Ranger<CR>
-- map <leader>ft :RangerNewTab<CR>
-- New
vim.keymap.set('n', '<leader>f', '<cmd>RnvimrToggle<CR>')


