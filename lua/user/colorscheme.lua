-- require("github-theme").setup({
--   comment_style = "italic",
--   keyword_style = "italic",
--   function_style = "italic",
--   variable_style = "italic",
--   theme_style = "dark",
--   sidebars = {"qf", "vista_kind", "terminal", "packer"},
--   transparent = true,

--   -- Change the "hint" color to the "orange" color, and make the "error" color bright red
--   colors = {hint = "orange", error = "#ff0000"},

--   -- Overwrite the highlight groups
--   overrides = function(c)
--     return {
--       htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
--       DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
--       -- this will remove the highlight groups
--       TSField = {},
--     }
--   end
-- })

-- require("transparent").setup({
--   enable = true,
-- })
-- vim.g.neon_style = 'dark'
-- vim.g.material_style = 'oceanic'
-- vim.g.material_style = "darker"
-- vim.g.material_style = "deep ocean"
-- local colorscheme = "material"
-- vim.cmd("colorscheme sonokai")

-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " not found!")
--   return
-- end
