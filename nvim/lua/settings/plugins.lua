return require('packer').startup(function()
  use "wbthomason/packer.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly' }
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use "windwp/nvim-autopairs"
  use "folke/which-key.nvim"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "windwp/nvim-ts-autotag"
  use "p00f/nvim-ts-rainbow"
  use "norcalli/nvim-colorizer.lua"
  use "lukas-reineke/indent-blankline.nvim" 
  -- use {'jdhao/better-escape.vim', event = 'InsertEnter'}
  use 'famiu/bufdelete.nvim'
  use 'iamcco/markdown-preview.nvim'

  -- Plugins below are for nvim-cmp (Auto-Completion)
  -- use 'neovim/nvim-lspconfig'
  -- use 'hrsh7th/cmp-nvim-lsp'
  -- use 'hrsh7th/cmp-buffer'
  -- use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  -- use 'hrsh7th/nvim-cmp'
  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'
end)

