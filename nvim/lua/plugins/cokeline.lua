-- +------------------+
-- |                  |
-- |   cokeline.lua   |
-- |                  |
-- +------------------+

return {
  "willothy/nvim-cokeline",
  config = function()
    require("cokeline").setup({
      -- Set tab colors
      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and "#BD93F9" or "#F8F8F2"
        end,
        bg = function(buffer)
          return buffer.is_focused and "#44475A" or "#34353B"
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
          -- style = function(buffer)
          --   return buffer.is_focused and "underline" or nil
          -- end,
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
  end,
}
