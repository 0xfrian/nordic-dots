-- ============
-- | nvim-cmp |
-- ============

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

-- Load VS-Code snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

-- Enable completion menu pop-up
vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	-- Style completion window
	window = {
		completion = {
			border = "rounded",
			scrollbar = "",
		},
		documentation = {
			border = "rounded",
			scrollbar = "",
		},
	},
	-- Assign snippets
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	-- Set keymappings
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- move to next suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- move to prev suggestion
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-q>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm choice
	}),
	-- Set sources of autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
	-- Configure lspkind
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
