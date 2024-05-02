local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup({
  sources = {
    -- null_ls.builtins.diagnostics.ruff,
    actions.eslint,
     formatting.prettier.with({
        filetypes = { "html", "json", "yaml", "markdown", "py" },
    }),
    -- diagnostics.flake8,    -- formatting.prettier.with {
    formatting.ruff,
    formatting.black,
    formatting.isort,
    -- null_ls.builtins.formatting.black
    --   extra_filetypes = { "toml", "solidity" },
    --   extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    -- },
    -- formatting.stylua,
    -- formatting.google_java_format,
  },
})
