return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
    config = function()
      -- require("lspconfig").clangd.setup({})
      -- require("lspconfig").pyright.setup({})
      -- require("lspconfig").cmake.setup({})
      -- require("lspconfig").docker_compose_language_service.setup({})
      -- require("lspconfig").dockerls.setup({})
      -- require("lspconfig").vimls.setup({})
    end,
  },
}
