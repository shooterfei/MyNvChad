-- local M = {}
--
--
--
-- -- local server_ready = require("custom.configs.lspconfig.lsp-installer")
-- M.setup_lsp = function(attach, capabilities)
--    local lsp_installer = require "nvim-lsp-installer"
--
--    lsp_installer.settings {
--       ui = {
--          icons = {
--             server_installed = "﫟" ,
--             server_pending = "",
--             server_uninstalled = "✗",
--          },
--       },
--    }
--
--
--    -- lsp_installer.on_server_ready(server_ready(attach, capabilities))
--
--    lsp_installer.on_server_ready(function (server)
--        local opts = {
--          on_attach = attach,
--          capabilities = capabilities,
--          flags = {
--             debounce_text_changes = 150,
--          },
--          settings = {}
--        } 
--
--         opts.on_attach = require("custom.configs.lspconfig.handlers").on_attach
--         -- opts.capabilities = require("custom.configs.lspconfig.handlers").capabilities
--
-- 	 if server.name == "jsonls" then
-- 	 	local jsonls_opts = require("custom.configs.lspconfig.settings.jsonls")
-- 	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
-- 	 end
--
-- 	 if server.name == "sumneko_lua" then
-- 	 	local sumneko_opts = require("custom.configs.lspconfig.settings.sumneko_lua")
-- 	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- 	 end
--
-- 	 if server.name == "pyright" then
-- 	 	local pyright_opts = require("custom.configs.lspconfig.settings.pyright")
-- 	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
-- 	 end
--
-- 	-- This setup() function is exactly the same as lspconfig's setup function.
-- 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
--     end)
-- end
--
-- return M



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
          local jsonls_opts = require("custom.configs.lspconfig.settings.jsonls")
          opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
   end

   if server.name == "sumneko_lua" then
          local sumneko_opts = require("custom.configs.lspconfig.settings.sumneko_lua")
          opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
   end

   if server.name == "pyright" then
          local pyright_opts = require("custom.configs.lspconfig.settings.pyright")
          opts = vim.tbl_deep_extend("force", pyright_opts, opts)
   end
   server:setup(opts)
   -- " vim.cmd [[ do User LspAttachBuffers ]]
end)
