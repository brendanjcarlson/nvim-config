return {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		local registry = require("mason-registry")

		local installed = {}
		for _, name in ipairs(registry.get_installed_package_names()) do
			installed[name] = true
		end

		local formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang-format" },
			html = { "rustywind", "prettierd", "prettier" },
			css = { "prettierd", "prettier", stop_after_first = true },
			go = { "goimports", "gofmt" },
			templ = { "rustywind", "templ" },
			javascript = { "rustywind", "prettierd" },
			javascriptreact = { "rustywind", "prettierd" },
			typescript = { "rustywind", "prettierd" },
			typescriptreact = { "rustywind", "prettierd" },
		}

		local formatters = {}
		local seen = {}
		for _, list in pairs(formatters_by_ft) do
			if type(list) == "table" then
				for _, name in ipairs(list) do
					if type(name) == "string" and not seen[name] then
						table.insert(formatters, name)
						seen[name] = true
					end
				end
			end
		end

		for _, name in ipairs(formatters) do
			if not installed[name] and registry.has_package(name) then
				vim.cmd(":MasonInstall " .. name)
			end
		end

		require("conform").setup({ formatters_by_ft = formatters_by_ft })

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				-- whitespace trimming
				local save_cursor = vim.fn.getpos(".")
				vim.cmd([[%s/\s\+$//e]])
				vim.fn.setpos(".", save_cursor)

				-- formatting
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
