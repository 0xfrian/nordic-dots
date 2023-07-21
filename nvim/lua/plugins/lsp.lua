-- +-------------+
-- |             |
-- |   lsp.lua   |
-- |             |
-- +-------------+

-- Define keymap alias for conciseness
local keymap = vim.keymap

  -- +-------------------+
  -- | Set Up Completion |
  -- +-------------------+
-- Enable auto-completion on available LSP servers
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(_, bufnr)
  -- Set keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Show definition
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  -- Peek definition
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  -- Show available documentation on cursor
  keymap.set("n", "gn", "<cmd>Lspsaga hover_doc<CR>", opts)
  -- Show code action(s)
  keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)
  -- Rename variable
  keymap.set("n", "gr", "<cmd>Lspsag rename<CR>", opts)
  -- Jump to prev/next diagnostic
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  -- Show outline
  keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
end

return {
  -- +-------+
  -- | Mason |
  -- +-------+
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- +------------------+
  -- | Mason LSP Config |
  -- +------------------+
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },

  -- +----------+
  -- | LSP Saga |
  -- +----------+
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        ui = {
          title = true,
          border = "rounded",
        },
        lightbulb = {
          enable = false,
        },
      })
    end,
  },

  -- +-----------------+
  -- | Nvim LSP Config |
  -- +-----------------+
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

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
            -- workspace = {
            --   library = vim.api.nvim_get_runtime_file("", true),
            -- },
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

