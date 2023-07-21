-- +-----------------+
-- |                 |
-- |   dracula.lua   |
-- |                 |
-- +-----------------+

return {
  "Mofiqul/dracula.nvim",
  priority = 1000,
  config = function()
    vim.cmd([[ colorscheme dracula ]])
    vim.cmd("hi CursorLine guibg=#15151F")
    vim.cmd("hi CursorColumn guibg=#15151F")
  end
}

