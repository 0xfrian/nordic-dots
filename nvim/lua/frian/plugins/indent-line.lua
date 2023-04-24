-- ====================
-- | indent-blankline |
-- ====================

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

-- Set highlight colors for indent lines
vim.opt.list = true
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#ff5555 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#50fa7b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#ff79c6 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#ffb86c gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#8be9fd gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#f1fa8c gui=nocombine]]

indent_blankline.setup({
	show_current_context = true,
	show_current_context_start = true,
})
