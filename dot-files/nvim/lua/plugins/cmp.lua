-- plugins/cmp.lua

return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        -- Configure luasnip
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      window = {
        completion = {
          border = "rounded",
          scrollbar = "",
        },
        documentation = {
          border = "rounded",
          scrollbar = "",
        },
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-q>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- lsp
        { name = "path" },      -- file system paths
        { name = "buffer" },    -- text within current buffer
      }),
    })
  end,
}
