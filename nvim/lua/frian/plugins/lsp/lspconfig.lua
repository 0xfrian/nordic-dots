-- ===================
-- | nvim-lsp-config |
-- ===================

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then return end

-- Enable rounded borders on LSP windows
vim.diagnostic.config(
  { float = { border = 'rounded' }
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then return end

local keymap = vim.keymap -- for conciseness

-- Enable keybinds only for when LSP server available
local on_attach = function(_, bufnr)
  -- Set keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Show definition
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  -- Peek definition
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  -- Rename variable
  keymap.set("n", "gr", "<cmd>Lspsag rename<CR>", opts)
  -- Jump to prev/next diagnostic
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  -- Show available documentation on cursor
  keymap.set("n", "gn", "<cmd>Lspsaga hover_doc<CR>", opts)
end

-- Enable auto-completion on available LSP servers
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- ======================
-- |                    |
-- |   Configure LSPs   |
-- |                    |
-- ======================
-- CSS
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  css = {
    lint = {
      unknownAtRules = "ignore",
    },
  },
})

-- Emmet (for auto-completion)
-- lspconfig["emmet_ls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- HTML
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Lua
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Make the language server recognize "vim" global
        globals = { "vim" },
      },
      workspace = {
        -- Make language server aware of runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        -- Disable telemetry
        enable = false,
      },
    },
  },
})

-- JSON
lspconfig["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Markdown
lspconfig["marksman"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
});

-- Prisma 
lspconfig["prismals"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Python
lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- TailwindCSS
-- lspconfig["tailwindcss"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- TypeScript
lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
});

-- TypeScript
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then return end

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

-- 

