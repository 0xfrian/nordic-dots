require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "html", "javascript", "lua" },

  -- Syntax Highlighting
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Autotag 
  autotag = {
    enable = true,
    filetypes = {
        'html', 'ejs', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
        'xml',
        'php',
        'markdown',
        'glimmer','handlebars','hbs'
    }
  },

  -- Rainbow
  rainbow = {
    enable = true,
    extended_mode = true,
  },

  -- Autpairs
  autopairs = {
    enable = true,
  }
}
