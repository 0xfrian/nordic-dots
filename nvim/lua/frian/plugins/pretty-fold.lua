-- ===============
-- | pretty-fold |
-- ===============

local status_ok, pretty_fold = pcall(require, "pretty-fold")
if not status_ok then
	return
end

pretty_fold.setup({
	fill_char = "━",
	sections = {
		left = {
			"━ ",
			function()
				return string.rep("*", vim.v.foldlevel)
			end,
			" ━┫",
			"content",
			"┣",
		},
		right = {
			"┫ ",
			"number_of_folded_lines",
			": ",
			"percentage",
			" ┣━━",
		},
	},
	remove_fold_markers = true,
	keep_indentation = true,
})
