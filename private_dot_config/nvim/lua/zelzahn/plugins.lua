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
	use {
		'neovim/nvim-lspconfig',
        config = function()
          require("zelzahn.plugin.lspconfig")
        end,
		after = { "cmp-nvim-lsp" }
	}

	-- CMP
	use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("zelzahn.plugin.cmp")
        end,
    })
    use({ "hrsh7th/cmp-nvim-lsp", ft = lspfiletypes })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    -- use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    -- use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
    use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
    use("onsails/lspkind-nvim")	

	-- Snippets
	use({
        "L3MON4D3/LuaSnip",
        after = "friendly-snippets" -- ,
        -- config = function()
        --     require("lars-vc.plugins.luasnip")
        -- end,
    })
    use({ "rafamadriz/friendly-snippets", after = "nvim-cmp" })	
	
	use {
		"lewis6991/hover.nvim",
    	config = function()
    	    require("hover").setup {
    	        init = function()
    	            -- Require providers
    	            require("hover.providers.lsp")
    	            -- require('hover.providers.gh')
    	            -- require('hover.providers.gh_user')
    	            -- require('hover.providers.jira')
    	            -- require('hover.providers.man')
    	            -- require('hover.providers.dictionary')
    	        end,
    	        preview_opts = {
    	            border = nil
    	        },
    	        -- Whether the contents of a currently open hover window should be moved
    	        -- to a :h preview-window when pressing the hover keymap.
    	        preview_window = false,
    	        title = true
    	    }

    	    -- Setup keymaps
    	    -- vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
    	    -- vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
    	end
	}

    if packer_bootstrap then
       require('packer').sync()
     end
end)

