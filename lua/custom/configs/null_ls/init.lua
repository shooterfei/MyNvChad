local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

   -- javascript
   b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },
   b.formatting.deno_fmt,

   -- go
   b.diagnostics.golangci_lint,
   b.formatting.gofmt,

   -- python
   b.diagnostics.pyproject_flake8,
   b.formatting.black,

   -- Lua
   b.formatting.stylua.with {
      -- env = {
      --    XDG_CONFIG_HOME = vim.fn.expand "~/.config/nvim/lua/custom/configs/formatter",
      -- },
      filetypes = { "lua" },
      command = "stylua",
      args = { "-s", "-" },
      -- extra_args = { "--config-path", vim.fn.expand "~/.config/nvim/lua/custom/configs/formatter/stylua.toml" },
   },
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- toml
   -- taplo 已经成为内置功能, 无需再此处配置
   -- b.formatting.taplo,

   -- git
   b.code_actions.gitsigns,
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      -- format on save
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
         end
      end,
   }
end

return M
