-- vim.cmd [[packadd packer.nvim]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Plugins
	-- Focused vim mode
	use 'junegunn/goyo.vim'
	use 'junegunn/limelight.vim'

	-- Markdown support
	use 'godlygeek/tabular'
	use 'elzr/vim-json'
	use 'plasticboy/vim-markdown'
	use({
   		 "iamcco/markdown-preview.nvim",
   		 run = function() vim.fn["mkdp#util#install"]() end,
	})

	-- Coloring
	use 'joshdick/onedark.vim'
	use { 'catppuccin/nvim', as ='catppuccin' }
	use 'sheerun/vim-polyglot'

	-- Statusline
	use 'itchyny/lightline.vim'

	-- Elixir
	use 'elixir-editors/vim-elixir'
	use 'mhinz/vim-mix-format'

	-- Smooth scrolling for Ctrl+D and Ctrl+F
	use 'psliwka/vim-smoothie'

	-- Git
	use 'tpope/vim-fugitive'

	-- Telescope
	use 'BurntSushi/ripgrep'
	use 'nvim-treesitter/nvim-treesitter'
	use 'sharkdp/fd'
	use { 
		'nvim-telescope/telescope.nvim', tag = 'nvim-0.6',
		requires = {{'nvim-lua/plenary.nvim'}}
	}

	-- Ranger
	-- use 'francoiscabrol/ranger.vim'
	-- use 'rbgrouleff/bclose.vim'
	use 'kevinhwang91/rnvimr'

	-- Latex
	use 'lervag/vimtex'

	-- File icons
	use 'nvim-tree/nvim-web-devicons'

	-- LSP
	use 'neovim/nvim-lspconfig'

    if packer_bootstrap then
       require('packer').sync()
     end
end)

