-- plugins/alpha.lua

return {
  "goolord/alpha-nvim",
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[]]
    }

    dashboard.section.buttons.val = {
      dashboard.button(
        "<Space>",
        "🤓 Continue",
        ":enew<CR>"
      ),
      dashboard.button(
        "f",
        "🗃️ Find File",
        ":Telescope find_files<CR>"
      ),
      dashboard.button(
        "t",
        "🔍 Find Text",
        ":Telescope live_grep<CR>"
      ),
      dashboard.button(
        "c",
        "⚙️  NeoVim Config",
        ":e ~/.config/nvim/<CR>"
      ),
      dashboard.button(
        "q",
        "🥺 Quit",
        ":qa<CR>"
      ),
    }

    dashboard.section.footer.val = {
      "Why not just use VSCode bruh",
    }

    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "MoreMsg"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    require("alpha").setup(dashboard.opts)
  end,
}

