local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  open_on_setup = false,
  open_on_setup_file = false,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    hide_root_folder = true,
    side = "left",
    mappings = {
      list = {
        { key = "<Tab>", action = "edit", mode = "n" },
        { key = "<CR>", action = "edit", mode = "n" },
        { key = "<C-w>", action = "close", mode = "n" },
        { key = "<C-s>", action = "close", mode = "n" },
        { key = "<C-q>", action = "close", mode = "n" },
        { key = "<C-c>", action = "close", mode = "n" },
        { key = "<Esc>", action = "close", mode = "n" },
      },
    },
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = false,
  },
  trash = {
    require_confirm = false,
  },
}

