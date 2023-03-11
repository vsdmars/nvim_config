return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          -- "clangd",
          "cmake",
          -- "dockerls",
          -- "docker_compose_language_service",
          "lua_ls",
          "remark_ls",
          "pyright",
          "rust_analyzer",
          -- "sqlls",
          -- "taplo",
          -- "vimls",
          "yamlls",
        },
        automatic_installation = true,
      })
    end,
  },
}
