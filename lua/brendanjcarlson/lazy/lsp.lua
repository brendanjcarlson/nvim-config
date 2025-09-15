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
