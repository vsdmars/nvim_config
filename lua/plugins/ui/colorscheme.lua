return {
  -- add symbols-outline
  {
    "arcticicestudio/nord-vim",
    lazy = false,
    priority = 1000,
    init = function()
      -- https://github.com/arcticicestudio/nord-vim
      vim.g.nord_cursor_line_number_background = true
      vim.g.nord_bold_vertical_split_line = true
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_italic_comments = true

      -- https://luabyexample.org/docs/nvim-autocmd/
      vim.api.nvim_create_augroup("nord-theme-overrides", {
        clear = true,
      })
      vim.cmd([[autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB ]])
      --[[
      augroup nord-theme-overrides
        autocmd!
        " Use 'nord7' as foreground color for Vim comment titles.
        autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
      augroup END
      ]]
      --
    end,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nord]])
    end,
  },
}
