return {
	"folke/trouble.nvim",
	opts = {
		auto_close = true,
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>" },
		{ "[t", "<cmd>Trouble diagnostics next<cr>" },
		{ "]t", "<cmd>Trouble diagnostics prev<cr>" },
	},
}
