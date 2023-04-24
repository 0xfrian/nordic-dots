-- ===============
-- | Colorscheme |
-- ===============

local status, _ = pcall(vim.cmd, "colorscheme dracula")
if not status then
	print("Colorscheme: Dracula not found")
	return
end
