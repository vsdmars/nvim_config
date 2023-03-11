return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          null_ls.builtins.completion.luasnip,
          null_ls.builtins.completion.spell,
          -- formatting
          null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.cmake_format,
          null_ls.builtins.formatting.fixjson,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.shfmt,
        },
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
        -- on_init = function(new_client, _)
        --   new_client.offset_encoding = "utf-8"
        -- end,
      }
    end,
  },
}
