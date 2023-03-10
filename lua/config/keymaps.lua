-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Move to next new line instead of enter insert mode
map("n", "<C-Enter>", "O<Esc>", {})
map("n", "<CR>", "o<Esc>", {})

-- Show line number
map("n", "<silent> <leader>N", ":set number!<CR>", {})

-- reference: https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim
-- Delete lines without adding them to the yank stack
-- the following mappings will produce:
-- d => "delete"
-- leader d => "cut"
map("n", "x", '"_x', { desc = "delete to black hole register" })
map("x", "x", '"_x', { desc = "delete to black hole register" })
map("n", "d", '"_d', { desc = "delete to black hole register" })
map("x", "d", '"_d', { desc = "delete to black hole register" })
map("n", "D", '"_D', { desc = "delete to black hole register" })
map("x", "D", '"_D', { desc = "delete to black hole register" })
map("n", "dd", '"_dd', { desc = "delete to black hole register" })

map("n", "p", '""p', { desc = "paste from unnamed register" })
map("x", "p", '""p', { desc = "paste from unnamed register" })

map("n", "<leader>d", '""d', { desc = "delete and yank" })
map("x", "<leader>d", '""d', { desc = "delete and yank" })
map("n", "<leader>x", '""x', { desc = "delete and yank" })
map("x", "<leader>x", '""x', { desc = "delete and yank" })
map("n", "<leader>dd", '""dd', { desc = "delete and yank" })
map("x", "<leader>dd", '""dd', { desc = "delete and yank" })
map("n", "<leader>D", '""D', { desc = "delete and yank" })
map("x", "<leader>D", '""D', { desc = "delete and yank" })

-- http://superuser.com/questions/410982/in-vim-how-can-i-quickly-switch-between-tabs
-- Go to tab by number
map("n", "<leader>1", "1gt", {})
map("n", "<leader>2", "2gt", {})
map("n", "<leader>3", "3gt", {})
map("n", "<leader>4", "4gt", {})
map("n", "<leader>5", "5gt", {})
map("n", "<leader>6", "6gt", {})
map("n", "<leader>7", "7gt", {})
map("n", "<leader>8", "8gt", {})
map("n", "<leader>9", "9gt", {})
map("n", "<leader>0", ":tablast<cr>", {})
map("n", "<A-Left>", ":tabm - 1<CR>", {})
map("n", "<A-Right>", ":tabm + 1<CR>", {})

-- Go to file in a new tab
map("n", "gF", "<C-W>gF", {})

vim.api.nvim_create_user_command("W", "w", { bang = true })
vim.api.nvim_create_user_command("Wq", "wq", { bang = true })
vim.api.nvim_create_user_command("Wqa", "wqa", { bang = true })
