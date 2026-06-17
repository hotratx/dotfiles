local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
  return
end

local cargo_bin = vim.fn.expand("~/.cargo/bin")
if vim.fn.executable(cargo_bin .. "/tree-sitter") == 1 then
  vim.env.PATH = cargo_bin .. ":" .. vim.env.PATH
end

local parsers = {
  "python",
  "svelte",
  "tsx",
  "html",
  "css",
  "json",
  "javascript",
  "typescript",
  "c",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
}

if type(treesitter.setup) == "function" then
  treesitter.setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
  })
end

if type(treesitter.install) == "function" then
  local function get_missing_parsers()
    if type(treesitter.get_installed) ~= "function" then
      return parsers
    end

    local installed = {}
    for _, parser in ipairs(treesitter.get_installed()) do
      installed[parser] = true
    end

    return vim.tbl_filter(function(parser)
      return not installed[parser]
    end, parsers)
  end

  local function install_configured(opts)
    opts = opts or {}
    local to_install = opts.force and parsers or get_missing_parsers()

    if #to_install == 0 then
      if opts.summary then
        vim.notify("All configured Treesitter parsers are installed", vim.log.levels.INFO)
      end
      return
    end

    return treesitter.install(to_install, { force = opts.force, summary = opts.summary })
  end

  vim.api.nvim_create_user_command("TSInstallConfigured", function(opts)
    install_configured({ force = opts.bang, summary = true })
  end, { bang = true, desc = "Install configured Treesitter parsers" })

  install_configured()
end

local group = vim.api.nvim_create_augroup("user_treesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = {
    "svelte",
    "tsx",
    "html",
    "css",
    "json",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "python",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown"
  },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = {
    "svelte",
    "tsx",
    "html",
    "css",
    "json",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "python",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown"
  },
  callback = function()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
