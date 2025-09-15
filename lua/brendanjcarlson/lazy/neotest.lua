return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"fredrikaverpil/neotest-golang",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-golang"),
			},
		})

		vim.keymap.set("n", "<leader>tv", function()
			require("neotest").summary.toggle()
		end)

		vim.keymap.set("n", "<leader>tr", function()
			require("neotest").run.run({
				suite = false,
				testify = true,
			})
		end)

		vim.keymap.set("n", "<leader>ts", function()
			require("neotest").run.run({
				suite = true,
				testify = true,
			})
		end)

		vim.keymap.set("n", "<leader>ta", function()
			require("neotest").run.run(vim.fn.getcwd())
		end)

		vim.keymap.set("n", "<leader>to", function()
			require("neotest").output.open()
		end)
	end,
}
