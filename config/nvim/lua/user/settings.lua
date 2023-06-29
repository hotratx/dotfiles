local options = {
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  smartindent = true,                      -- make indenting smarter again
  smartcase = true,                        -- smart case
  showtabline = 2,                         -- always show tabs
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  pumheight = 10,                          -- pop up menu height
  mouse = "a",                             -- allow the mouse to be used in neovim
  conceallevel = 0,                        -- so that `` is visible in markdown files
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  -- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  foldmethod = 'marker',
  backup = false,                          -- creates a backup file
  number = true,                           -- set numbered lines
  relativenumber = true,                  -- set relative numbered lines
  hlsearch = true,                         -- highlight all matches on previous search pattern
  fileencoding = "utf-8",                  -- the encoding written to a file
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  scrolloff = 8,                           -- is one of my fav
  expandtab = true,                        -- convert tabs to spaces
  ignorecase = true,                       -- ignore case in search patterns
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  scrolljump = 8,
  sidescrolloff = 8,
  laststatus = 2,
  -- termguicolors = true                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

}


vim.opt.termguicolors = true
vim.g.mkdp_auto_start = 0
vim.g.clipboard = 1
-- vim.gloaded_clipboard_provider = 1

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[ syntax on ]])
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set clipboard+=unnamedplus]]
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd [[set nocompatible]]
vim.cmd [[set title]]
vim.cmd [[set autoindent]]
vim.cmd [[set showcmd]]
vim.cmd [[set cursorline]]
vim.cmd [[highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40]]
vim.cmd [[set shell=zsh]]
-- vim.wo.colorcolumn = '80'


vim.opt.shortmess:append "c"


vim.g.clipboard = {
  name = 'myClipboard',
  copy = {
      ["+"] = {'tmux', 'load-buffer', '-'},
      ["*"] = {'tmux', 'load-buffer', '-'},
  },
  paste = {
      ["+"] = {'tmux', 'save-buffer', '-'},
      ["*"] = {'tmux', 'save-buffer', '-'},
  },
  cache_enabled = true,
}
