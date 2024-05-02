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
    ensure_installed = { "pyright" },
}

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
          on_attach = require("user.lsp.handlers").on_attach,
          capabilities = require("user.lsp.handlers").capabilities
      }
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
}


require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      -- workspace = {
      --   library = {
      --     [vim.fn.expand "$VIMRUNTIME/lua"] = true,
      --     [vim.fn.stdpath "config" .. "/lua"] = true,
      --   },
      -- },
    },
  },
}

require("lspconfig").pyright.setup {
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

require('lspconfig').ruff_lsp.setup {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
  settings = {
    -- Any extra CLI arguments for `ruff` go here.
    args = {},
  }
}
