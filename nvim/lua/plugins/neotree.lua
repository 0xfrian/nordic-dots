-- +-----------------+
-- |                 |
-- |   neotree.lua   |
-- |                 |
-- +-----------------+

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        width = 30,
        mappings = {
          ["<tab>"] = "open",
          ["<bs>"] = "close_node",
          ["z"] = "",
        }
      }
    })
  end
}

