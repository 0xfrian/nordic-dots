-- plugins/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function on_attach(bufnr)
      local nvim_tree_api = require("nvim-tree.api")
      local telescope_api = require("telescope.builtin")

      local function opts(desc)
        return {
          desc = 'nvim-tree: ' .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      -- Assign default keymappings
      nvim_tree_api.config.mappings.default_on_attach(bufnr)

      -- Assign custom keymappings
      vim.keymap.set("n", "<C-q>", nvim_tree_api.tree.close, opts("Close"))
      vim.keymap.set("n", "<CR>", nvim_tree_api.node.open.no_window_picker, opts("Open"))
      vim.keymap.set("n", "<Tab>", nvim_tree_api.node.open.no_window_picker, opts("Open"))
      vim.keymap.set("n", "<C-r>", nvim_tree_api.tree.reload, opts("Refresh"))
      -- vim.keymap.set("n", "<C-t>", telescope_api.find_files, opts("Refresh"))
      vim.keymap.set("n", "<C-t>", nvim_tree_api.tree.close, opts("Refresh"))
      vim.keymap.set("n", "C", nvim_tree_api.node.navigate.parent_close, opts("Close Directory"))
      vim.keymap.set("n", "M", nvim_tree_api.marks.bulk.move, opts("Move"))
      vim.keymap.set("n", "?", nvim_tree_api.tree.toggle_help, opts("Help"))

      -- Unmap keys
      vim.keymap.del("n", "J", { buffer = bufnr })
      vim.keymap.del("n", "K", { buffer = bufnr })
      vim.keymap.del("n", "bd", { buffer = bufnr })
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      -- hijack_unnamed_buffer_when_opening = true,
      filters = {
        custom = { "^.git$" }, -- hide .git directory
        git_ignored = false,   -- show git-ignored files/folders
        dotfiles = false,      -- show dot-files
      },
      view = {
        number = true, -- show line numbers
        float = {
          enable = true,
          open_win_config = {
            width = 30,
            height = 30,
            row = 1,
            col = 1,
          }
        },
      },
      renderer = {
        root_folder_label = false,
      },
    })
  end,
}
