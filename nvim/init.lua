-- ============
-- | init.lua |
-- ============

--- Plugins
require("frian.packer")
require("frian.plugins.alpha") -- Dashboard
require("frian.plugins.autopairs") -- Auto-pair symbols: (), [], {}, <>
require("frian.plugins.cmp") -- Auto-completion
require("frian.plugins.cokeline") -- Bufferline
require("frian.plugins.colorizer") -- Color code highlighting
require("frian.plugins.comment") -- Shortcut commenting
require("frian.plugins.gitsigns") -- Git gutter signs
require("frian.plugins.impatient") -- Speed up start-time
require("frian.plugins.indent-line") -- Show indentation lines
require("frian.plugins.lualine") -- Statusline
require("frian.plugins.neotree") -- File explorer
require("frian.plugins.surround") -- nvim-surround
require("frian.plugins.telescope") -- Fuzzy finder
require("frian.plugins.tree") -- File explorer
require("frian.plugins.treesitter") -- Syntax highlighting
require("frian.plugins.trouble") -- Error logging
require("frian.plugins.pretty-fold") -- Code block folding

-- LSP
require("frian.plugins.lsp.mason") -- LSP server manager
require("frian.plugins.lsp.lspconfig") -- LSP server installer
require("frian.plugins.lsp.lspsaga") -- LSP UI extension
-- require("frian.plugins.lsp.null-ls")

-- Core
require("frian.core.colorscheme") -- Colorscheme
require("frian.core.keymappings") -- Vim keymappings
require("frian.core.options") -- Vim settings
