local plugin_settings = require("core.utils").load_config().plugins

return {

   {
      "windwp/nvim-ts-autotag",
      ft = { "html", "javascriptreact" },
      after = "nvim-treesitter",
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   },

   {
      -- disable = not plugin_settings.status.alpha,
      "goolord/alpha-nvim",
      config = require("core.utils").override_req("alpha", "custom.configs.dashboard"),
   },

   {
      "tpope/vim-surround",
   },

   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },

   {
      "nvim-telescope/telescope-media-files.nvim",
      after = "telescope.nvim",
      config = function()
         require("telescope").setup {
            extensions = {
               media_files = {
                  filetypes = { "png", "webp", "jpg", "jpeg" },
               },
               -- fd is needed
            },
         }
         require("telescope").load_extension "media_files"
      end,
   },

   {
      "Pocco81/TrueZen.nvim",
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
         require "custom.plugins.truezen"
      end,
   },

   {
      "mg979/vim-visual-multi",
      branch = "master",
   },

   {
      "williamboman/nvim-lsp-installer",
      config = function()
         require "custom.configs.lspconfig"
      end,

      -- lazy load!
      setup = function()
         require("core.utils").packer_lazy_load "nvim-lsp-installer"
         -- reload the current file so lsp actually starts for it
         vim.defer_fn(function()
            vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
         end, 0)
      end,
      opt = true,
   },

   -- custom plugins
   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.configs.null_ls").setup()
      end,
   },

   {
      "neovim/nvim-lspconfig",
      module = "lspconfig",
      after = "nvim-lsp-installer",
   },

   {
      "ray-x/lsp_signature.nvim",
      after = "nvim-lspconfig",
      config = function()
         require "custom.configs.signature"
      end,
   },

   -- load luasnips + cmp related in insert mode only
   {
      "rafamadriz/friendly-snippets",
      event = "InsertEnter",
   },

   {
      "hrsh7th/nvim-cmp",
      after = "friendly-snippets",
      config = function()
         require "custom.configs.cmp"
      end,
   },

   {
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
         local luasnip = require "luasnip"
         luasnip.config.set_config {
            history = true,
            updateevents = "TextChanged,TextChangedI",
         }
         require("luasnip/loaders/from_vscode").load()
      end,
   },

   {
      "saadparwaiz1/cmp_luasnip",
      after = "LuaSnip",
   },

   {
      "hrsh7th/cmp-nvim-lua",
      after = "cmp_luasnip",
   },

   {
      "hrsh7th/cmp-nvim-lsp",
      after = "cmp-nvim-lua",
   },

   {
      "hrsh7th/cmp-buffer",
      after = "cmp-nvim-lsp",
   },

   {
      "hrsh7th/cmp-path",
      after = "cmp-buffer",
   },

   {
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = function()
         local autopairs = require "nvim-autopairs"
         local cmp_autopairs = require "nvim-autopairs.completion.cmp"

         autopairs.setup { fast_wrap = {} }

         local cmp = require "cmp"
         cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
   },

   -- ???????????????
   -- ????????????
   {
      "easymotion/vim-easymotion",
   },

   {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
      config = function()
         require("telescope").load_extension "lazygit"
      end,
   },
   {
      "chrisbra/unicode.vim",
   },
   -- ??????????????????????????????
   {
      "farmergreg/vim-lastplace",
   },

   -- ??????????????????
   {
      "mbbill/undotree",
      opt = true,
      cmd = "UndotreeToggle",
   },

   -- ????????????????????????
   {
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
   },

   -- ??????????????????
   {
      "lambdalisue/suda.vim",
      cmd = "SudaWrite",
   },

   -- ??????????????????
   {
      "skywind3000/asynctasks.vim",
      requires = "skywind3000/asyncrun.vim",
      cmd = { "AsyncTask", "AsyncTaskEdit" },
   },

   -- markdown??????
   {
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install",
      ft = "markdown",
   },

   -- ??????markdown??????
   {
      "dhruvasagar/vim-table-mode",
      cmd = "TableModeToggle",
   },
}
