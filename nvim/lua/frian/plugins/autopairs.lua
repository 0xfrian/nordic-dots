-- ==================
-- | nvim-autopairs |
-- ==================

local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
	return
end

autopairs.setup({
	check_ts = true, -- enable treesitter
  disable_filetype = { "TelescopePrompt" , "vim" },
})

local status_cmp_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not status_cmp_autopairs then
	return
end

local status_cmp, cmp = pcall(require, "cmp")
if not status_cmp then
	return
end

-- Set autopairs and nvim cmp together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
