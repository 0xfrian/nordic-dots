require'nvim-tree'.setup {
  open_on_setup = true,
  update_cwd = true,
  view = {
    number = true,
    mappings = {
      list = {
        { key = {"<CR>"},   action = "edit_no_picker", mode = "n" }, 
        { key = {"<Tab>"},  action = "edit_no_picker", mode = "n" }
      }
    }
  },
  renderer = {
    indent_markers = {
      enable = true
    }
  }
}
