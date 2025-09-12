return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"markdown",
				"markdown_inline",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"rust",
				"templ",
				"html",
			},
			sync_install = false,
			auto_install = true,
			additional_vim_regex_highlighting = false,
		})
	end,
}
