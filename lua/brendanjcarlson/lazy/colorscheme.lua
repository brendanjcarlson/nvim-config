-- return {}

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- }

return {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		local onedark = require("onedark")
		onedark.setup({ style = "darker" })
		onedark.load()
	end,
}
