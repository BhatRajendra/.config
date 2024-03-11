-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>k", "<cmd>bdelete<CR>", { desc = "kill buffer" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "select all" })
vim.keymap.set("n", "<leader>wq", "<cmd>wqa<CR>", { desc = "save and quit all" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>ni", "i<CR><esc>", { desc = "insert new line" })
vim.keymap.set("n", "<leader>na", "a<CR><esc>", { desc = "insert new line after the cursor" })
vim.keymap.set("n", "<leader>no", "o<CR><esc>", { desc = "insert new line" })
vim.keymap.set("n", "<C-j>", "<C-d>zz", { desc = "go up a down page" })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { desc = "go up a up page" })
vim.keymap.set("v", '<leader>"', 'c""<esc>hp', { desc = "put double quotes" })
vim.keymap.set("v", "<leader>'", "c''<esc>hp", { desc = "put single quotes" })
