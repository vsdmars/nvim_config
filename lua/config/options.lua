-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- yank to the system register (*) by default
vim.opt.clipboard:append("unnamed")

-- disable relativenumber from lazyvim
vim.wo.relativenumber = false

-- Specifies for which events the bell will not be rung. It is a comma-
-- separated list of items. For each item that is present, the bell will be
-- silenced. This is most useful to specify specific events in insert mode to
-- be silenced.
vim.opt.belloff = "all"

-- not compatible with the old-fashion vi mode
vim.opt.compatible = false

-- set buffer hidden
vim.opt.hidden = true

-- beware of potential security issues
vim.opt.exrc = true

-- When secure is on, ":autocmd", shell and write commands are not allowed in
-- .nvimrc" and ".exrc" in the current directory and map commands are
-- displayed.
vim.opt.secure = true
-- go with set exrc

vim.g.hostname = vim.fn.hostname()
vim.g.python3_host_prog = "python3"

vim.cmd("filetype plugin indent on")

-- get Lua syntax highlighting inside .vim
vim.g.vimsyn_embed = "l"
vim.o.syntax = true

-- Completion mode that is used for the character specified with 'wildchar'
-- "full"
--    Complete the next full match.  After the last match, the original string
--    is used and then the first match again.  Will also start 'wildmenu' if it
--    is enabled.
-- "longest"
--    Complete till longest common string.  If this doesn't result in a longer
--    string, use the next part.
-- "lastused"
--    When completing buffer names and more than one buffer matches, sort
--    buffers by time last used (other than the current buffer).
vim.wildmode = { "full", "longest", "lastused" }

-- Display the completion matches using the popupmenu in the same style as the
-- |ins-completion-menu|.
vim.wildoptions = "pum"

-- A comma-separated list of options for Insert mode completion
-- |ins-completion|.
-- menuone
--    Use the popup menu also when there is only one match. Useful when there
--    is additional information about the match, e.g., what file it comes from.
-- noselect
--    Do not select a match in the menu, force the user to select one from the
--    menu. Only works in combination with "menu" or "menuone".
vim.opt.completeopt = { "menuone", "noselect", "menu", "preview", "noinsert" }

-- Determine how text with the "conceal" syntax attribute |:syn-conceal| is
-- shown:
-- 0		Text is shown normally
vim.opt.conceallevel = 2
vim.opt.concealcursor = niv

-- VIM_OPT.fileencodings = "ucs-bom,utf-8,big5,gb2312,latin1
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.termencoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- VIM_OPT.fileencodings = "ucs-bom,utf-8,big5,gb2312,latin1

-- When there is a previous search pattern, highlight all its matches.
vim.opt.hlsearch = true
vim.opt.ignorecase = false
-- ignore case if search pattern is all lowercase,case-sensitive otherwise
vim.opt.smartcase = true
-- insert tabs on the start of a line according to context
vim.opt.smarttab = true

vim.opt.wildignore = { "*.o", "*~", "*.pyc", "*pycache*", "*.o", "*.so", "*.swp", "*.zip", "*.out" }

-- Popup menu options
-- pumblend - Enables pseudo-transparency for the |popup-menu|
-- pumheight - Popup menu height
vim.opt.pumblend = 20
vim.opt.pumheight = 15

vim.opt.showtabline = 2

vim.opt.smartindent = true
vim.opt.autoindent = true

-- formatoptions default: "tcqj"
--  + "t" -- Auto-wrap text using textwidth
--  + "c" -- Auto-wrap comments using textwidth, inserting the current comment
--  -- leader automatically.
--  + "q" -- Allow formatting of comments with "gq".
--  + "j" -- Where it makes sense, remove a comment leader when joining lines.
vim.opt.formatoptions:append("rn1")

--  + "r" -- Automatically insert the current comment leader after hitting
--  -- <Enter> in Insert mode.
--  + "n" -- When formatting text, recognize numbered lists.
--  + "1" -- Don't break a line after a one-letter word. It's broken before it
--  -- instead (if possible).
vim.opt.formatoptions:remove("oa2")

--  - "o" -- Automatically insert the current comment leader after hitting 'o' or
--  -- 'O' in Normal mode. In case comment is unwanted in a specific place
--  - "a" -- Automatic formatting of paragraphs. Every time text is inserted or
--  -- deleted the paragraph will be reformatted. See |auto-format|.
--  - "2" -- When formatting text, use the indent of the second line of a
--  -- paragraph for the rest of the paragraph, instead of the indent of
--  -- the first line. This supports paragraphs in which the first line has
--  -- a
vim.opt.joinspaces = false
-- Concept credit: https://github.com/tjdevries

vim.opt.swapfile = false

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- The minimal number of screen columns to keep to the left and to the right of
-- the cursor if 'nowrap' is set.
vim.opt.sidescrolloff = 8

-- The value of this option influences when the last window will have a status
-- line:
--  0: never
-- 	1: only if there are at least two windows
-- 	2: always
-- 	3: always and ONLY the last window
vim.opt.laststatus = 2

-- show the cursor position all the time
vim.opt.ruler = true

-- Cursor shows matching ) and }
vim.opt.showmatch = true

-- Highlight the current line
vim.opt.cursorline = true

-- Delete comment character(s) when joining commented lines
vim.opt.formatoptions = vim.opt.formatoptions + "j"

-- Indent Guides
vim.opt.colorcolumn = "80"
vim.cmd([[highlight ColorColumn ctermbg=0 guibg=lightgrey]])

vim.cmd("source $HOME/.config/nvim/config/all-config.vim")
require("config.functions")
