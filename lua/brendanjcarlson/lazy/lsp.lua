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
			gopls = {},
		},
	},

	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"clangd",
			},
		})
	end,
}
