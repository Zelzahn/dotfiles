local lspkind = require("lspkind")
lspkind.init()
-- Set up nvim-cmp.
local cmp = require("cmp")

local small_mapping = {
	["<S-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.confirm({ select = true })
		else
			fallback()
		end
	end, { "i", "c" }),
	["<C-j>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		else
			fallback()
		end
	end, { "i", "c" }),
	["<C-k>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
			fallback()
		end
	end, { "i", "c" }),
}

local small_format = {
	format = lspkind.cmp_format({
		mode = "symbol_text",
		menu = {
			buffer = "[Buf]",
			nvim_lsp = "[LSP]",
			path = "[Path]",
			luasnip = "[LuaSnip]",
			nvim_lua = "[Lua]",
		},
	}),
}

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-u>"] = cmp.mapping.scroll_docs(4),
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
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		-- { name = "path" },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = "buffer", keyword_length = 4 },
	}),
	formatting = small_format,
	experimental = {
		ghost_text = true,
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = small_mapping,
	sources = {
		{ name = "buffer" },
	},
	formatting = small_format,
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = small_mapping,
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	formatting = small_format,
})

