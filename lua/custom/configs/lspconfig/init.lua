require("plugins.configs.others").lsp_handlers()

local function on_attach(_, bufnr)
   local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
   end

   -- Enable completion triggered by <c-x><c-o>
   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
   require("core.mappings").lspconfig()
end

-- local on_attach = require("custom.configs.lspconfig.handlers").on_attach

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_installer = require "nvim-lsp-installer"

lsp_installer.settings {
   ui = {
      icons = {
         server_installed = "﫟",
         server_pending = "",
         server_uninstalled = "✗",
      },
   },
}
lsp_installer.on_server_ready(function(server)
   -- server options, so default options for all servers
   local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
         debounce_text_changes = 150,
      },
      settings = {},
   }

   if server.name == "jsonls" then
      local jsonls_opts = require "custom.configs.lspconfig.settings.jsonls"
      opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
   end

   if server.name == "sumneko_lua" then
      local sumneko_opts = require "custom.configs.lspconfig.settings.sumneko_lua"
      opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
   end

   if server.name == "pyright" then
      local pyright_opts = require "custom.configs.lspconfig.settings.pyright"
      opts = vim.tbl_deep_extend("force", pyright_opts, opts)
   end
   if server.name == "tailwindcss" then
      local tailwindcss_opts = require "custom.configs.lspconfig.settings.tailwindcss"
      opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
   end
   server:setup(opts)
   -- " vim.cmd [[ do User LspAttachBuffers ]]
end)
