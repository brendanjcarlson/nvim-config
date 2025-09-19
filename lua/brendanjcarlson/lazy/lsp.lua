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
		require("lazydev").setup({})
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(opts.servers),
			handlers = {
				function(server_name)
					local server_opts = opts.servers[server_name] or {}
					server_opts.capabilities = require("blink.cmp").get_lsp_capabilities(server_opts.capabilities)
					require("lspconfig")[server_name].setup(server_opts)
				end,
			},
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(e)
				local o = { buffer = e.buf }
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, o)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, o)
				vim.keymap.set("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, o)
				vim.keymap.set("n", "<leader>rn", function()
					vim.lsp.buf.rename()
				end, o)
			end,
		})
	end,
}
