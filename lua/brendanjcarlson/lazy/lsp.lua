return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/lazydev.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},

	opts = {
		servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			clangd = {},
			rust_analyzer = {},
			html = {},
			htmx = {},
			cssls = {},
			gopls = {},
			templ = {},
			vtsls = {},
		},
	},

	config = function(_, opts)
		require("lazydev").setup({})
		require("mason").setup({})
		require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(opts.servers) })

		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
