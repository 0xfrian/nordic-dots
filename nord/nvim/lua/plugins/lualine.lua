-- +-----------------+
-- |                 |
-- |   lualine.lua   |
-- |                 |
-- +-----------------+


return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        -- theme = 'dracula',
        theme = 'nord',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = { "neo-tree" },
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            path = 3,
            symbols = {
              modified = "[*]",          -- current changes are unsaved
              readonly = "[read]",       -- current file is read-only
              unnamed = "[unnamed]",     -- text to show for unnamed buffers
            }
          }
        },
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            path = 3,
            symbols = {
              modified = "[*]",          -- current changes are unsaved
              readonly = "[read]",       -- current file is read-only
              unnamed = "[unnamed]",     -- text to show for unnamed buffers
            }
          }
        },
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
      },
      tabline = {},
      extensions = {}
    })
  end,
}

