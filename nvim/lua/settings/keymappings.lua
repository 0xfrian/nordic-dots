-- Options
local opts = {  noremap = true, 
                silent = true
              }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "         -- remap <Leader> key  
-- vim.g.maplocalleader = " "    -- remap <Leader> key 

-- Modes
--      all                 = "", 
--      normal_mode         = "n",
--      insert_mode         = "i",
--      visual_mode         = "v",
--      visual_block_mode   = "x",
--      term_mode           = "t",
--      command_mode        = "c",

-- Open Splits 
keymap("n", "<Leader>v", ":vsplit<CR>", opts)
keymap("n", "<Leader>h", ":split<CR>",  opts)
-- Directionally Navigate Between Splits 
keymap("n", "<C-h>", "<C-w><Left>", opts)
keymap("n", "<C-j>", "<C-w><Left>", opts)
keymap("n", "<C-k>", "<C-w><Right>", opts)
keymap("n", "<C-l>", "<C-w><Right>", opts)
-- Resize Splits 
keymap("n", "<C-Up>",     ":resize +2<CR>",           opts)
keymap("n", "<C-Down>",   ":resize -2<CR>",           opts)
keymap("n", "<C-Left>",   ":vertical resize -2<CR>",  opts)
keymap("n", "<C-Right>",  ":vertical resize +2<CR>",  opts)
-- Close Current Split
keymap("n", "<Leader>c",  ":<C-w>q<CR>", opts)

-- Navigate Between Buffers
keymap("n", "<C-Tab>",      ":bn<CR>", opts)
keymap("n", "<C-S-Tab>",    ":bp<CR>", opts)
-- Close Current Buffer
keymap("n", "<C-c>", ":Bdelete<CR>", opts)  -- using bufdelete.nvim plugin

-- Toggle Spellcheck
keymap("n", "<Leader>s", ":set spell!<CR>", opts)
-- Toggle Line Numbers
keymap("n", "<Leader>n", ":set number!<CR>", opts)
-- Toggle Linebreak
keymap("n", "<Leader>b", ":set linebreak!<CR>", opts)
-- Toggle Line Wrap
keymap("n", "<Leader>w", ":set wrap!<CR>", opts)

-- Toggle Markdown Preview
keymap("n", "<C-m>", ":MarkdownPreview<CR>", opts)
-- Toggle NvimTree 
keymap("n", "<C-n>", ":NvimTreeToggle<CR>",  opts)
-- Toggle Telescope Find Files
keymap("n", "<C-t>", ":Telescope find_files<CR>", opts)
-- Toggle Telescope Live Grep
keymap("n", "<C-g>", ":Telescope live_grep<CR>", opts)

-- Navigating to Start/End of Line 
keymap("", "H", "^", opts) 
keymap("", "L", "$", opts) 
-- Navigating Up/Down Lines faster
keymap("", "J", "5j", opts)
keymap("", "K", "5k", opts)
-- Navigating Up/Down Visual Lines rather than Logical Lines
keymap("", "j", "gj", opts)
keymap("", "k", "gk", opts)

-- Deleting Text
keymap("n", "dH", "d0", opts)
keymap("n", "dL", "ld$", opts)

-- Saving File 
keymap("n", "<C-s>", ":w<CR>",      opts)
keymap("i", "<C-s>", "<Esc>:w<CR>", opts)
keymap("v", "<C-s>", "<Esc>:w<CR>", opts)
-- Exiting NeoVim (w/o saving)
keymap("n", "<C-q>", ":q!<CR>",       opts)
keymap("i", "<C-q>", "<Esc>:q!<CR>",  opts)
keymap("v", "<C-q>", "<Esc>:q!<CR>",  opts)
-- Exiting NeoVim (w/ saving)
keymap("n", "<C-w>", ":wq<CR>",       opts)
keymap("i", "<C-w>", "<Esc>:wq<CR>",  opts)
keymap("v", "<C-w>", "<Esc>:wq<CR>",  opts)

-- Escaping to Normal Mode
keymap("i", "kj", "<Esc>", opts)       -- using kj 

-- Indent and Stay in Visual Mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- Misc
keymap("n", "<Esc>", ":noh<CR>", opts)     -- Clear search pattern highlighting

