-- ============
-- | cokeline |
-- ============

local status_cokeline, cokeline = pcall(require, "cokeline")
if not status_cokeline then
	return
end

cokeline.setup({
	-- Set tab colors
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and "#f8f8f2" or "#dededc"
		end,
		bg = function(buffer)
			return buffer.is_focused and "#44475a" or "#2e303d"
		end,
	},

	-- Set individual tab components
	components = {
		{ text = " " },
		{
			text = function(buffer)
				return buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},
		{
			text = function(buffer)
				return buffer.filename .. " "
			end,
			style = function(buffer)
				return buffer.is_focused and "underline" or nil
			end,
		},
		{
			text = function(buffer)
				return buffer.is_modified and "●" or ""
			end,
			fg = function(buffer)
				return buffer.is_modified and "#8be9fd" or nil
			end,
			delete_buffer_on_left_click = false,
			truncation = { priority = 1 },
		},
		{ text = " " },
	},
})
