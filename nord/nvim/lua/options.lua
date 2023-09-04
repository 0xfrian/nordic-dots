-- options.lua

-- ===== Line Numbers and Wrapping ===================================
vim.opt.number = false -- enable line numbers
vim.opt.numberwidth = 1 -- set width of line number column
vim.opt.wrap = true -- enable line wrapping
vim.opt.wrapmargin = 0
vim.opt.linebreak = true -- break line at nearest word instead of char
vim.opt.textwidth = 70  -- set text width at 70 chars

-- ===== Tabs, Indentations, and Folds ===============================
vim.opt.tabstop = 2 -- set tab size to N spaces
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- set shift width (width of auto-indent)
vim.opt.autoindent = true -- enable auto-indent
vim.opt.expandtab = true -- enable tabbing inserts spaces
vim.opt.foldmethod = "indent" -- set folds to be defined by indents
vim.opt.foldlevel = 99 -- open file with all folds open

-- ===== Search ======================================================
vim.opt.ignorecase = true -- assume case-insensitive search
vim.opt.smartcase = true -- enable smart seach

-- ===== Appearance ==================================================
vim.opt.cursorline = true -- enable line highlight
vim.opt.cursorcolumn = true -- enable column highlight
vim.opt.termguicolors = true -- enable more colors
vim.opt.signcolumn = "yes" -- enable sign column
vim.opt.fillchars = { eob = " "}  -- remove tilde symbol on empty lines

-- ===== Misc ========================================================
vim.opt.clipboard = "unnamedplus" -- enable clipboard copy/paste
vim.opt.cmdheight = 0 -- height of command textbox
vim.opt.mouse = "" -- remove mouse input
vim.opt.iskeyword:append("-") -- hyphenated words are grouped as 1 word
vim.opt.backspace = "indent,eol,start" -- set normal backspace behavior
vim.opt.laststatus = 3
vim.opt.splitright = true -- horizontal splits open on the right
vim.opt.splitbelow = true -- vertical splits open on the bottom
vim.opt.completeopt = "menu,menuone,noselect" -- enable completion pop-up
