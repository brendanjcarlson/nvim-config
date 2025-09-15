return {
	"neovim/nvim-lspconfig",
	dependencies = {
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
						workspace = {
							library = vim.api.nvim_get_runtime_file("lua", true),
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
		require("mason").setup({})
		require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(opts.servers) })

		for server, config in pairs(opts.servers) do
			require("lspconfig")[server].setup(vim.tbl_deep_extend(
				"force",
				config,
				{ capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities) }
			))
		end

	end,
}
