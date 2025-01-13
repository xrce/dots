return {
  "goolord/alpha-nvim",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local alpha = require "alpha"
    local startify = require "alpha.themes.startify"

    startify.section.header.val = {
      "      ▀    ",
      "█▀█▄█▀█▀█▀█",
    }

    startify.section.top_buttons.val = {
      startify.button("n", "  New", ":ene <BAR> startinsert <CR>"),
      startify.button("o", "  Open", ":Telescope find_files<CR>"),
      startify.button("r", "  Recent", ":Telescope oldfiles<CR>"),
    }

    startify.section.bottom_buttons.val = {
      startify.button("u", "󰒲  Update", ":Lazy sync<CR>"),
      startify.button("c", "  Config", ":e $MYVIMRC<CR>"),
      startify.button("q", "󰅚  Quit", ":qa!<CR>"),
    }

    startify.section.mru.val = { { type = "padding", val = 0 } }
    startify.file_icons.highlight = false

    startify.section.footer.val = {
      { type = "text", val = " ", opts = { hl = "Type" } },
      { type = "text", val = " ", opts = { hl = "Type" } },
    }

    startify.config.opts.margin = 3
    startify.config.opts.redraw_on_resize = true

    alpha.setup(startify.config)
  end,
}
