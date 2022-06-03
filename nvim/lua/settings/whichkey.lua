local wk = require("which-key")
local mappings = {
  -- Splits
  v = {":vsplit<CR>", "New Split (Vertical)"},
  h = {":split<CR>",  "New Split (Horizontal)"},
  x = {"<C-w>q",      "Close Split"},
  -- Telescope
  t = {":Telescope find_files<CR>", "Find Files"},
  -- NvimTree
  n = {":NvimTreeToggle<CR>", "File Explorer"},
  -- Saving & Quitting
  w = {":w<CR>",      "Save"},
  W = {":wq<CR>",     "Save & quit"},
  q = {":q<CR>",      "Quit"},
  Q = {":q!<CR>",     "Quit w/o saving"},
}
local opts = {
  prefix = "<Leader>"
}
wk.register(mappings, opts)
