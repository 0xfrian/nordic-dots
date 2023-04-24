-- ===========
-- | Options |
-- ===========

-- Line Numbers
vim.opt.number = true -- enable line numbers
vim.opt.numberwidth = 1 -- set width of line number column

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- enable clipboard copy/paste (yank/paste)

-- Tabs / Indentation / Folds
vim.opt.tabstop = 2 -- set tab size to N spaces
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- set shift width (width of auto-indent)
-- vim.opt.showbreak = "›››" -- indicate line-break
vim.opt.autoindent = true -- enable auto-indent
vim.opt.expandtab = true -- enable tabbing inserts spaces
vim.opt.foldmethod = "indent" -- set folds to be defined by indents
vim.opt.foldlevel = 99 -- open file with all folds open

-- Line-Wrapping
vim.opt.wrap = true -- enable line wrapping
vim.opt.wrapmargin = 0
vim.opt.linebreak = true -- break line at nearest word instead of char
vim.opt.textwidth = 0
-- vim.opt.columns = 80 -- automatically insert new line at 80 col

-- Search
vim.opt.ignorecase = true -- assume case-insensitive search
vim.opt.smartcase = true -- enable smart seach

-- Cursor
vim.opt.cursorline = true -- enable line highlight
vim.opt.cursorcolumn = true -- enable column highlight

-- Appearance
vim.opt.termguicolors = true -- enable more colors
vim.opt.background = "dark" -- enable dark background
vim.opt.signcolumn = "yes" -- enable sign column

-- Misc
vim.opt.mouse = "" -- remove mouse input
vim.opt.iskeyword:append("-") -- hyphenated words are grouped as 1 word
vim.opt.backspace = "indent,eol,start" -- set normal backspace behavior
vim.opt.laststatus = 3
vim.opt.splitright = true -- horizontal splits open on the right
vim.opt.splitbelow = true -- vertical splits open on the bottom

-- Set cursor highlight colors
vim.cmd("highlight CursorLine guibg=#15151F")
vim.cmd("highlight CursorColumn guibg=#15151F")
