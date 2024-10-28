return {
	{ -- Autocompletions
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet engine
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					--Build Step needed for regex support
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						-- friendly-snippets
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",

			-- more nvim-cmp completions
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require "luasnip"
			luasnip.config.setup {}

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeotp = "menu,menuone,noinsert" },
				-- mappings
				mapping = cmp.mapping.preset.insert({
					-- select the [n]ext item
					['<Tab>'] = cmp.mapping.select_next_item(),
					-- select the [p]revious item
					['<S-Tab>'] = cmp.mapping.select_prev_item(),

					-- Scroll the documentation window
					-- [b]ackwards
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					-- [f]forwards
					['<C-f>'] = cmp.mapping.scroll_docs(4),

					-- Accept completion
					['<C-y>'] = cmp.mapping.confirm({ select = true }),

					-- Trigger a completion manually
					['<C-Space>'] = cmp.mapping.complete({}),

					-- Moving through snippets
					-- move to the right of the expansion locations
					['<C-l>'] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					-- move backwards in the expansion locations
					['<C-h>'] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{
						name = "lazydev",
						-- set group index to 0 to skip laoding LuaLS completions as lazydev recommends
						group_index = 0,
					},
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
