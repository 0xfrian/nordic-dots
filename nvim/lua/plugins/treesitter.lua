-- +--------------------+
-- |                    |
-- |   treesitter.lua   |
-- |                    |
-- +--------------------+

return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- Enable indentation
      indent = { enable = true },
      -- Enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = { enable = true },
      -- Ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "gitignore",
      },
      -- Auto install above language parsers
      auto_install = true,
      -- Enable rainbow coloring
      rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
          "#FF5555",
          "#50FA7B",
          "#FF79C6",
          "#FFB86C",
          "#8BE9FD",
          "#F1FA8C",
          "#6272A4",
        },
      },
    })
  end,
}

