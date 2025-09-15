return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	opts = {
		servers = {
			lua_ls = {},
			clangd = {},
			rust_analyzer = {},
			html = {},
			htmx = {},
			cssls = {},
			gopls = {},
			templ = {},
			ts_ls = {},
		},
	},

	config = function(_, opts)
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"rust_analyzer",
				"html",
				"htmx",
				"cssls",
				"gopls",
				"templ",
				"ts_ls",
			},
		})

		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
