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
				"css",
				"svelte",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			ignore_install = {},
			modules = {},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "templ",
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
