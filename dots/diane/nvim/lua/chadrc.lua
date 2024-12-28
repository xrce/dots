-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}
local stats = require("lazy").stats()

M.base46 = {
	theme = "tundra",
	transparency = true,
}

M.nvdash = {
	load_on_startup = true,
	header = {
		"                         ",
		"                    ▀    ",
  		"              █▀█▄█▀█▀█▀█",
		"                         ",
	  },
  
	  buttons = {
		{ txt = "                     " .. stats.loaded .. "/" .. stats.count, hl = "NvDashFooter", no_gap = true },
		{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

		{ txt = "  Open", keys = "o", cmd = ":lua require('telescope').extensions.smart_open.smart_open()" },
		{ txt = "  New", keys = "n", cmd = "ene | startinsert" },
		{ txt = "  Recent", keys = "r", cmd = "Telescope oldfiles" },
		{ txt = "󰒲  Update", keys = "u", cmd = "Lazy sync" },
		{ txt = "󱥚  Themes", keys = "s", cmd = ":lua require('nvchad.themes').open()" },
		{ txt = "  Keymap", keys = "m", cmd = "NvCheatsheet" },
		{ txt = "  Quit", keys = "q", cmd = ":qa!" },

		{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  
		{
		  txt = function()
			return "󱎫  " .. (math.floor(stats.startuptime * 100 + 0.5) / 100) .. " ms              "
		  end,
		  hl = "NvDashFooter",
		  no_gap = true,
		},
	  },
}

return M
