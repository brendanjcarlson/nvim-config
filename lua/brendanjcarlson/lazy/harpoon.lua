return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>m1", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>m2", function()
			harpoon:list():next()
		end)
		vim.keymap.set("n", "<leader>m3", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>m4", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
	end,
}
