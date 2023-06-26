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
	-- Easily manage editor tooling
	-- use {
	-- 	"williamboman/mason.nvim",
	-- 	"williamboman/mason-lspconfig.nvim",
  	-- 	"neovim/nvim-lspconfig",
    -- 	run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	-- }
	
	-- Visualize lsp progress
	use({
	  "j-hui/fidget.nvim",
	  tag="legacy",
	  config = function()
	    require("fidget").setup()
	  end
	})

	-- Fancy notifications
	use 'rcarriga/nvim-notify'

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
	use { 'catppuccin/nvim', as ='catppuccin' }
	use 'sheerun/vim-polyglot'

	-- Statusline
	use 'itchyny/lightline.vim'

	-- Elixir
	-- use 'elixir-editors/vim-elixir'
	-- use 'mhinz/vim-mix-format'
	use { 
		"elixir-tools/elixir-tools.nvim", tag = "stable",
		requires = { "nvim-lua/plenary.nvim" }
	}

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

	use 'voldikss/vim-floaterm'

	-- Ranger
	-- use 'francoiscabrol/ranger.vim'
	-- use 'rbgrouleff/bclose.vim'
	use 'kevinhwang91/rnvimr'

	-- Latex
	use 'lervag/vimtex'

	-- File icons
	use 'nvim-tree/nvim-web-devicons'

	-- Better folding
	use {
		'kevinhwang91/nvim-ufo', 
		requires = 'kevinhwang91/promise-async',
		config =  function()
		   require("zelzahn.plugin.ufo")
		end
	}

	-- LSP
	use {
		'neovim/nvim-lspconfig',
        config = function()
          require("zelzahn.plugin.lspconfig")
        end
	}

	-- Commenting
	use({"numToStr/Comment.nvim"})

   use {
		"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {} end
	} 
	-- Autocompletion framework
	use({
		"hrsh7th/nvim-cmp",
		-- after = "nvim-autopairs",
		config = function()
			require("zelzahn.plugin.cmp")
		end,
	})
  	use({
  	  -- cmp LSP completion
  	  "hrsh7th/cmp-nvim-lsp",
  	  -- cmp Snippet completion
  	  "hrsh7th/cmp-vsnip",
  	  -- cmp Path completion
  	  "hrsh7th/cmp-path",
  	  "hrsh7th/cmp-buffer",
	  "hrsh7th/cmp-nvim-lua",
	  "hrsh7th/cmp-nvim-lsp-signature-help",
  	  after = { "hrsh7th/nvim-cmp" },
  	  requires = { "hrsh7th/nvim-cmp" },
  	})
  	-- See hrsh7th other plugins for more great completion sources!
  	-- Snippet engine
  	use('hrsh7th/vim-vsnip')	
	use({ "onsails/lspkind-nvim" })

    if packer_bootstrap then
       require('packer').sync()
     end
end)

