local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")

	-- Color Theme: Dracula
	use("Mofiqul/dracula.nvim")

	-- Alpha: dashboard
	use("goolord/alpha-nvim")

	-- Nvim-Tree: file explorer
	use({ "kyazdani42/nvim-tree.lua", tag = "nightly" })

	-- Treesitter: syntax highlighting
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow") -- Rainbow: color-code parentheses/brackets
	use("windwp/nvim-autopairs") -- AutoPairs: auto-complete parentheses/brackets
	use("windwp/nvim-ts-autotag") -- AutoTag: auto-complete html tags
	use("lukas-reineke/indent-blankline.nvim") -- Indent-Blankline: indentation lines
	use("terrortylor/nvim-comment") -- Comment: comment multiple lines
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Context-Comment: format comment to filetype

	-- cmp: Auto-Completion
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions

	-- LSP: Language server protocol (syntax highlighting)
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")

	-- Telescope: Fuzzy Finder
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })

	-- LuaLine: Status Bar
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

	-- BufferLine: Buffer Bar
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" })

	-- Headlines: Text Decoration (Markdown Files)
	use({ "lukas-reineke/headlines.nvim" })

	-- Colorizer: Colorize text
	use("NvChad/nvim-colorizer.lua")

	-- Pretty-Fold: Fold indentation lines
	use("anuvyklack/pretty-fold.nvim")

	-- Scrollbar
	use("petertriho/nvim-scrollbar")

	-- GitSigns: highlighting for Git
	use("lewis6991/gitsigns.nvim")

	-- Impatient: Optimize NeoVim config
	use("lewis6991/impatient.nvim")

	-- bufdel: Delete buffers with ease
	use({ "ojroques/nvim-bufdel" })

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
