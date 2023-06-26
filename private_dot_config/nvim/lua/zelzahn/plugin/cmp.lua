local lspkind = require("lspkind")
lspkind.init()
-- Set up nvim-cmp.
local cmp = require("cmp")

-- local small_mapping = {
-- 	["<S-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
-- 	["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
-- 	["<Tab>"] = cmp.mapping(function(fallback)
-- 		if cmp.visible() then
-- 			cmp.confirm({ select = true })
-- 		else
-- 			fallback()
-- 		end
-- 	end, { "i", "c" }),
-- 	["<C-j>"] = cmp.mapping(function(fallback)
-- 		if cmp.visible() then
-- 			cmp.select_next_item()
-- 		else
-- 			fallback()
-- 		end
-- 	end, { "i", "c" }),
-- 	["<C-k>"] = cmp.mapping(function(fallback)
-- 		if cmp.visible() then
-- 			cmp.select_prev_item()
-- 		else
-- 			fallback()
-- 		end
-- 	end, { "i", "c" }),
-- }

-- local small_format = {
-- 	fields = {'menu', 'abbr', 'kind'},
-- 	format = lspkind.cmp_format({
-- 		mode = "symbol_text",
-- 		menu = {
-- 			buffer = "[Buf]",
-- 			nvim_lsp = "[LSP]",
-- 			path = "[Path]",
-- 			luasnip = "[LuaSnip]",
-- 			vsnip = "[VSnip]",
-- 			nvim_lua = "[Lua]",
-- 		},
-- 	}),
-- }

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	-- window = {
	-- 	completion = cmp.config.window.bordered(),
	-- 	documentation = cmp.config.window.bordered(),
	-- },
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<S-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true })
			else
				fallback()
			end
		end),
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end),
	}),
	sources = cmp.config.sources({
		{ name = 'path' },                              -- file paths
		{ name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    	{ name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    	{ name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    	{ name = 'buffer', keyword_length = 2 },        -- source current buffer
    	{ name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    	-- { name = 'calc'},                               -- source for math calculationsignature_help" },
		-- { name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}),
	-- formatting = small_format,
	-- experimental = {
	-- 	ghost_text = true,
	-- },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline("/", {
-- 	mapping = small_mapping,
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- 	formatting = small_format,
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
-- 	mapping = small_mapping,
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "cmdline" },
-- 	}),
-- 	formatting = small_format,
-- })

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
-- vim.wo.signcolumn = "yes"

-- " Set updatetime for CursorHold
-- " 300ms of no cursor movement to trigger CursorHold
-- set updatetime=300
-- vim.opt.updatetime = 100

