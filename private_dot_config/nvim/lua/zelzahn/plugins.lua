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
local lspfiletypes = { "c", "cpp", "rust", "lua", "python", "elixir" }

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Plugins
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

	-- Ranger
	-- use 'francoiscabrol/ranger.vim'
	-- use 'rbgrouleff/bclose.vim'
	use 'kevinhwang91/rnvimr'

	-- Latex
	use 'lervag/vimtex'

	-- File icons
	use 'nvim-tree/nvim-web-devicons'

	-- LSP
	use {
		'neovim/nvim-lspconfig',
        config = function()
          require("zelzahn.plugin.lspconfig")
        end
	}

	-- CMP
	use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("zelzahn.plugin.cmp")
        end,
    })
    use({ "hrsh7th/cmp-nvim-lsp", ft = lspfiletypes })
    use({ "hrsh7th/cmp-buffer" })
    -- use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    -- use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
    use({ "saadparwaiz1/cmp_luasnip" })
    use("onsails/lspkind-nvim")	

	-- Snippets
	use({
        "L3MON4D3/LuaSnip"
        -- config = function()
        --     require("lars-vc.plugins.luasnip")
        -- end,
    })
    use({ "rafamadriz/friendly-snippets" })	
	
    if packer_bootstrap then
       require('packer').sync()
     end
end)

