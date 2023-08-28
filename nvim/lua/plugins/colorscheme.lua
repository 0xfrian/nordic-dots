-- +---------------------+
-- |                     |
-- |   colorscheme.lua   |
-- |                     |
-- +---------------------+

return {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[ colorscheme nord ]])
  end
}

-- return {
--   "AlexvZyl/nordic.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("nordic").setup({
--       -- This callback can be used to override the colors used in the palette.
--       on_palette = function(palette) return palette end,
--       -- Enable bold keywords.
--       bold_keywords = false,
--       -- Enable italic comments.
--       italic_comments = true,
--       -- Enable general editor background transparency.
--       transparent_bg = false,
--       -- Enable brighter float border.
--       bright_border = false,
--       -- Reduce the overall amount of blue in the theme (diverges from base Nord).
--       reduced_blue = true,
--       -- Swap the dark background with the normal one.
--       swap_backgrounds = true,
--       -- Override the styling of any highlight group.
--       override = {},
--       -- Cursorline options.  Also includes visual/selection.
--       cursorline = {
--         -- Bold font in cursorline.
--         bold = false,
--         -- Bold cursorline number.
--         bold_number = true,
--         -- Avialable styles: 'dark', 'light'.
--         theme = 'light',
--         -- Blending the cursorline bg with the buffer bg.
--         blend = 0.3,
--       },
--       noice = {
--         -- Available styles: `classic`, `flat`.
--         style = 'flat',
--       },
--       telescope = {
--         -- Available styles: `classic`, `flat`.
--         style = 'flat',
--       },
--       leap = {
--         -- Dims the backdrop when using leap.
--         dim_backdrop = false,
--       },
--       ts_context = {
--         -- Enables dark background for treesitter-context window
--         dark_background = true,
--       }
--     }).load()
--   end
-- }

-- return {
--   "Mofiqul/dracula.nvim",
--   priority = 1000,
--   config = function()
--     vim.cmd([[ colorscheme dracula ]])
--     vim.cmd("hi CursorLine guibg=#15151F")
--     vim.cmd("hi CursorColumn guibg=#15151F")
--   end
-- }
