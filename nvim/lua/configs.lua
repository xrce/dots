-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true

-- Performance
vim.opt.lazyredraw = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

vim.opt.laststatus = 0
vim.api.nvim_set_hl(0, 'Statusline', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'StatuslineNC', { link = 'Normal' })
