local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General keymaps
map("n", "<C-s>", ":w<CR>", opts)                      -- Save file
map("n", "<C-w>", ":bd<CR>", opts)                     -- Close buffer
map("n", "<C-q>", ":qa!<CR>", opts)                    -- Quit
map("n", "<C-e>", ":lua Snacks.dashboard()<CR>", opts) -- Dashboard
map("n", "<C-n>", ":ene | startinsert<CR>", opts)      -- New buffer
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)         -- NvimTree

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

-- Terminal
map("n", "<C-j>", ":lua Snacks.terminal.toggle()<CR>", opts)
map("n", "<C-t>", ":lua Snacks.terminal.open()<CR>", opts)
