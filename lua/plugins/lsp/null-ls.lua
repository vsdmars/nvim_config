return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    init = function()
      vim.cmd("map <Leader>lf :lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>")
    end,
    config = function()
      local null_ls = require("null-ls")
      local b = null_ls.builtins

      local with_diagnostics_code = function(builtin)
        return builtin.with({
          diagnostics_format = "#{m} [#{c}]",
        })
      end

      local with_root_file = function(builtin, file)
        return builtin.with({
          condition = function(utils)
            return utils.root_has_file(file)
          end,
        })
      end

      local sources = {
        -- format html and markdown
        b.formatting.prettierd.with({ filetypes = { "html", "yaml", "markdown" } }),
        -- markdown diagnostic
        b.diagnostics.markdownlint,
        -- formatting
        b.formatting.black.with({ extra_args = { "--fast" } }),
        b.formatting.isort,
        b.formatting.clang_format,
        b.formatting.cmake_format,
        b.formatting.fixjson,
        b.formatting.prettierd,
        b.formatting.rustfmt,
        b.formatting.stylua,
        b.formatting.shfmt,
        with_root_file(b.formatting.stylua, "stylua.toml"),
        with_diagnostics_code(b.diagnostics.shellcheck),
      }

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end

      null_ls.setup({
        debug = true,
        sources = sources,
        on_attach = on_attach,
      })
    end,
  },
}
