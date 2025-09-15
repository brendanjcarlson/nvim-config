return {
	"stevearc/conform.nvim",

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				go = { "goimports", "gofmt" },
				templ = { "goimports", "templ", "htmx" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
			},
		})
	end,
}
