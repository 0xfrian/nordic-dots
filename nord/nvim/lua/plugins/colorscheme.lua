-- plugins/colorscheme.lua

return {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[ colorscheme nord ]])
    vim.cmd([[ hi VertSplit guifg=#4C566A ]])
    vim.cmd([[ hi WinSeparator guifg=#4C566A ]])
  end
}
