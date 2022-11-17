require("headlines").setup({
    markdown = {
        headline_highlights = { 
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
        },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        dash_string = "-",
        quote_highlight = "Quote",
        quote_string = "┃",
        fat_headlines = true,
        fat_headline_upper_string = "",
        fat_headline_lower_string = "",
    },
})

vim.cmd [[highlight Headline1 guifg=#282a36 guibg=#ff5555]]
vim.cmd [[highlight Headline2 guifg=#282a36 guibg=#50fa7b]]
vim.cmd [[highlight Headline3 guifg=#282a36 guibg=#ff79c6]]
vim.cmd [[highlight Headline4 guifg=#282a36 guibg=#bd93f9]]
vim.cmd [[highlight Headline5 guifg=#282a36 guibg=#ffb86c]]
vim.cmd [[highlight Headline6 guifg=#282a36 guibg=#6272a4]]
vim.cmd [[highlight CodeBlock guibg=#1d1f26]]

