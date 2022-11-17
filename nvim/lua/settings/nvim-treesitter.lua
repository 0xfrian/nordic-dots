local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
    sync_install = false,
	ignore_install = { "haskell", "ruby", "tlaplus" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
	},
	autopairs = {
		enable = true,
	},
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable=true,
    },
	indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            "#ff5555",
            "#50fa7b",
            "#ff79c6",
            "#ffb86c",
            "#8be9fd",
            "#f1fa8c",
            "#6272a4",
        },
    },
})

