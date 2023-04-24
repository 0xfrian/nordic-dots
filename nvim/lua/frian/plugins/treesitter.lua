-- ===================
-- | nvim-treesitter |
-- ===================

local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	-- Enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- Enable indentation
	indent = { enable = true },
	-- Enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- Ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"markdown",
    "markdown_inline",
		"bash",
		"lua",
		"vim",
		"gitignore",
	},
	-- Auto install above language parsers
	auto_install = true,
	-- Enable rainbow coloring
	rainbow = {
		enable = true,
		extended_mode = true,
		colors = {
			"#ff5555",
			"#50fa7b",
			"#ff79c6",
			"#ffb86c",
			"#8be9fd",
			"#f1fa8c",
			"#6272a4",
		},
	},
})
