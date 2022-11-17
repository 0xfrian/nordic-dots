local nvim_lsp_installer = require("nvim-lsp-installer")
local nvim_lsp = require("lspconfig")

nvim_lsp_installer.setup{}

-- Bash 
nvim_lsp.bashls.setup{}

-- HTML
nvim_lsp.html.setup{}

-- CSS
nvim_lsp.cssls.setup{}

-- JavaScript, TypeScript
-- nvim_lsp.eslint.setup {}

-- TypeScript, JavaScript, JSX
nvim_lsp.tsserver.setup{}
    -- init_options = {
    --     preferences = {
    --         disableSuggestions = true,
    --     }
    -- }
-- }

-- JSON
nvim_lsp.jsonls.setup{}

-- Markdown
nvim_lsp.marksman.setup{}

-- Lua
nvim_lsp.sumneko_lua.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- Python 
require'lspconfig'.pyright.setup{}

