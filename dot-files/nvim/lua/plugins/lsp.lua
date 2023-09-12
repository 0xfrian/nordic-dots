-- plugins/lsp.lua

-- Define keymap alias
local keymap = vim.keymap

-- Enable auto-completion on available LSP servers
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Assign LSP Saga keymappings to each buffer
local on_attach = function(_, bufnr)
  -- Set keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }
  -- Show definition
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  -- Peek definition
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  -- See references
  keymap.set("n", "gR", vim.lsp.buf.references, opts)
  -- See implementation
  keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  -- Show documentation on cursor
  keymap.set("n", "gn", "<cmd>Lspsaga hover_doc<CR>", opts)
  -- Rename variable
  keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
  -- Code Action
  keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)
  -- Show diagnostics on current line
  keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  -- Jump to prev/next diagnostic
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  -- Format code
  keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

return {
  -- Mason
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },

  -- LSP Saga
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        ui = { title = true, border = "rounded" },
        lightbulb = { enable = false },
      })
    end,
  },

  -- Neovim LSP-Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Bash: bashls
      lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- CSS: cssls
      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        css = {
          lint = { unknownAtRules = "ignore" },
        },
      })

      -- HTML: html
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- JSON: jsonls
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Lua: lua_ls
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
          },
        },
      })

      -- Markdown: marksman
      lspconfig.marksman.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Python: pyright
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Rust: rust_analyzer
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- TypeScript: tsserver
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  },
}
