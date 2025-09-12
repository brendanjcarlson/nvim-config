return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"navasaru/onedarkpro.nvim",
		name = "one-dark-pro",
		config = function()
			vim.cmd("colorscheme one-dark-pro")
		end,
	},
}
