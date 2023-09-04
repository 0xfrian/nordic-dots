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
      filters = {
        custom = { "^.git$" }, -- hide .git directory
        git_ignored = false, -- show git-ignored files/folders
        dotfiles = false, -- show dot-files
      },
      view = {
        hide_root_folder = true, -- hide root directory
        number = true, -- show line numbers
      }
    })
  end,
}
