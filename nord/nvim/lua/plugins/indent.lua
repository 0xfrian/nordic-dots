-- plugins/indent.lua

return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("indent_blankline").setup({
      use_treesitter = true,
      show_current_context = true,
      show_current_context_start = true,
      show_trailing_blankline_indent = true,
    })
  end,
}

