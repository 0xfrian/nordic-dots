-- plugins/treesitter.lua

return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "cmake",
          "lua",
          "markdown",
          "markdown_inline",
          "regex",
          "vim",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
      })
    end,
  },

  -- nvim-autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      -- Enable treesitter
      require("nvim-autopairs").setup({ check_ts = true })

      -- Configure nvim-autopairs and nvim-cmp together
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
