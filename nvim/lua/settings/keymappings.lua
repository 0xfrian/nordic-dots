-- Options
local opts = {  noremap = true, 
                silent = true
              }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "         -- remap <Leader> key to <Space>
vim.g.maplocalleader = " "

-- Modes
--    normal_mode =         "n",
--    insert_mode =         "i",
--    visual_mode =         "v",
--    visual_block_mode =   "x",
--    term_mode =           "t",
--    command_mode =        "c",

-- Open Windows 
keymap("n", "<Leader>v", ":vsplit<CR>", opts)
keymap("n", "<Leader>h", ":split<CR>",  opts)
-- Navigate Between Windows 
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize Windows 
keymap("n", "<C-Up>",     ":resize -2<CR>",           opts)
keymap("n", "<C-Down>",   ":resize +2<CR>",           opts)
keymap("n", "<C-Left>",   ":vertical resize -2<CR>",  opts)
keymap("n", "<C-Right>",  ":vertical resize +2<CR>",  opts)
-- Close Current Window
keymap("n", "<Leader>c",  ":<C-w>q<CR>", opts)

-- Navigate Between Buffers
-- keymap("n", "<C-a>", ":bp<CR>", opts)
-- keymap("n", "<C-d>", ":bn<CR>", opts)
keymap("n", "<C-Tab>",      ":bn<CR>", opts)
keymap("n", "<C-S-Tab>",    ":bp<CR>", opts)
-- Open File in New Buffer
-- keymap("n", "<C-e>", ":e ", { noremap = true })
-- Close Current Buffer
-- keymap("n", "<C-c>", ":bd<CR>", opts)
keymap("n", "<C-c>", ":Bdelete<CR>", opts)  -- using bufdelete.nvim plugin

-- Toggle NvimTree 
keymap("n", "<C-n>", ":NvimTreeToggle<CR>",  opts)

-- Toggle Telescope Find Files
keymap("n", "<C-t>", ":Telescope find_files<CR>", opts)
-- Toggle Telescope Live Grep
keymap("n", "<C-g>", ":Telescope live_grep<CR>", opts)

-- Navigating to Start/End of Line 
keymap("n", "H", "^", opts) 
keymap("n", "L", "$", opts) 
keymap("v", "H", "^", opts) 
keymap("v", "L", "$", opts) 
keymap("x", "H", "^", opts) 
keymap("x", "L", "$", opts) 
-- Navigating Up/Down Lines Fast
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)
keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)
keymap("x", "J", "5j", opts)
keymap("x", "K", "5k", opts)
-- Navigating Up/Down Visual Lines rather than Logical Lines
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
-- Navigating Up to Avoid Waiting timeoutlen 
-- keymap("n", "kk", "kk", opts)
-- keymap("v", "kk", "kk", opts)
-- keymap("x", "kk", "kk", opts)

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
keymap("i", "kj", "<Esc>l", opts)       -- using kj 
-- keymap("v", "kj", "<Esc>l", opts) 
-- keymap("x", "kj", "<Esc>l", opts) 
keymap("i", "<Esc>", "<Esc>l",  opts);

-- Indent and Stay in Visual Mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- Misc
-- keymap("n", "ff", "zz", opts)           -- Center cursor
keymap("n", "<Esc>", ":noh<CR>l", opts)  -- Clear search pattern highlighting

-- Unmapping Default Keymappings
keymap("n", "<C-b>", "<nop>", opts)   -- Unmap PgUp
keymap("v", "<C-b>", "<nop>", opts)  
keymap("x", "<C-b>", "<nop>", opts)  
keymap("n", "<C-f>", "<nop>", opts)   -- Unmap PgDown
keymap("v", "<C-f>", "<nop>", opts)   
keymap("x", "<C-f>", "<nop>", opts)   
keymap("n", "<C-a>", "<nop>", opts)   -- Unmap Ctrl+a 
keymap("v", "<C-a>", "<nop>", opts)   
keymap("x", "<C-a>", "<nop>", opts)   
keymap("n", "<C-d>", "<nop>", opts)   -- Unmap Ctrl-d
keymap("v", "<C-d>", "<nop>", opts)   
keymap("x", "<C-d>", "<nop>", opts)   

