-- plugins/headlines.lua

return {
  "lukas-reineke/headlines.nvim",
  config = function()
    -- Set headline colors
    vim.cmd([[ highlight Headline1 guifg=#ECEFF4 guibg=#BF616A ]])
    vim.cmd([[ highlight Headline2 guifg=#ECEFF4 guibg=#D08770 ]])
    vim.cmd([[ highlight Headline3 guifg=#ECEFF4 guibg=#5E81AC ]])
    vim.cmd([[ highlight Headline4 guifg=#ECEFF4 guibg=#B48EAD ]])

    require("headlines").setup({
      markdown = {
        fat_headlines = false,
        headline_highlights = {
          "Headline1",
          "Headline2",
          "Headline3",
          "Headline4",
        },
      },
    })
  end
}
