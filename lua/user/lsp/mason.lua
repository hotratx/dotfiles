local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  return
end

local handlers = require("user.lsp.handlers")

local servers = {
  "lua_ls",
  "pyright",
  "ruff",
  "jsonls",
  "cssls",
  "vimls",
  "texlab",
}

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
  automatic_enable = false,
})

for _, server in ipairs(servers) do
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  local has_custom_opts, custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, custom_opts)
  end

  if vim.lsp.config and vim.lsp.enable then
    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
  else
    local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
    if lspconfig_ok and lspconfig[server] then
      lspconfig[server].setup(opts)
    end
  end
end
