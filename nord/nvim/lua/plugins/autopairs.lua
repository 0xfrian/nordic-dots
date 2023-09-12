-- +-------------------+
-- |                   |
-- |   autopairs.lua   |
-- |                   |
-- +-------------------+

return {
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- enable treesitter
        disable_filetype = { "TelescopePrompt" , "vim" },
      })

      -- Configure autopairs and nvim cmp together
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}

