-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- yank to the system register (*) by default
vim.opt.clipboard:append("unnamed")

-- disable relativenumber from lazyvim
vim.wo.relativenumber = false
