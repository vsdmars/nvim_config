return {
  -- add symbols-outline
  {
    "numToStr/Comment.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      require("Comment").setup({
        toggler = {
          -- -Line-comment toggle keymap
          line = "<leader>cc",
          ---Block-comment toggle keymap
          block = "<leader>bc",
        },
        opleader = {
          ---Line-comment keymap
          line = "<leader>c",
          ---Block-comment keymap
          block = "<leader>cb",
        },
        extra = {
          ---Add comment on the line above
          above = "<leader>cO",
          ---Add comment on the line below
          below = "<leader>co",
          ---Add comment at the end of line
          eol = "<leader>cA",
        },
      })
    end,
  },
}
