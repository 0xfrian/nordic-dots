-- plugins/comment.lua

return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
  end,
}
