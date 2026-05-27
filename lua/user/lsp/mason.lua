local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    automatic_installation = true,
    ensure_installed = { 'lua_ls', 'pyright', 'ruff'},
    automatic_enable = true,   
}

vim.lsp.enable('pyright')

local has_new_api = vim.lsp and vim.lsp.config

if has_new_api then
  vim.lsp.config['pyright'] = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "on",
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        },
      },
    },
  }
  vim.lsp.start(vim.lsp.config['pyright'])
else
  require('lspconfig').pyright.setup {
    on_attach = require("user.lsp.handlers").on_attachon_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
end

-- require("lspconfig").lua_ls.setup {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" },
--       },
--       -- workspace = {
--       --   library = {
--       --     [vim.fn.expand "$VIMRUNTIME/lua"] = true,
--       --     [vim.fn.stdpath "config" .. "/lua"] = true,
--       --   },
--       -- },
--     },
--   },
-- }

-- require("lspconfig").pyright.setup {
--   on_attach = require("user.lsp.handlers").on_attach,
--   capabilities = require("user.lsp.handlers").capabilities,
--   settings = {
--     python = {
--       analysis = {
--         typeCheckingMode = "on",
--         autoSearchPaths = true,
--         diagnosticMode = "workspace",
--         useLibraryCodeForTypes = true
--       },
--     },
--   },
-- }
-- 
