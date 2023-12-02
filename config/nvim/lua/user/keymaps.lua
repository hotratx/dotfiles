local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.clipboard = {
  name = 'TmuxTermux',
  cache_enabled = 1,
}

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Ranger
keymap("n", "<M-o>", ":RnvimrToggle<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<M-j>", ":bnext<CR>", opts)
keymap("n", "<M-k>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)

-- Custom
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)
-- NOTE: the fact that tab and ctrl-i are the same is stupid
-- keymap("n", "<TAB>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<F1>", ":e ~/Notes/<cr>", opts)
keymap("n", "<F3>", ":e .<cr>", opts)
keymap("n", "<F4>", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<F5>", "<cmd>Telescope commands<CR>", opts)
keymap(
  "n",
  "<F6>",
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  opts
)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", opts)
keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)
keymap(
  "n",
  ";f",
  "<cmd>lua require('telescope.builtin').find_files({layout_strategy='horizontal',layout_config={width=0.8}})<cr>",
  opts
)
keymap(
  "n",
  ";g",
  "<cmd>lua require('telescope.builtin').live_grep({layout_strategy='vertical',layout_config={width=0.5}})<cr>",
  opts
)
keymap(
  "n",
  ";d",
  ":Telescope file_browser<cr>",
  opts
)
keymap(
  "n",
  ";u",
  "<cmd>cd %:h<cr>",
  opts
)


-- 3 nnoremap <silent> ;f <cmd>Telescope find_files<cr>
--   4 nnoremap <silent> ;g <cmd>Telescope live_grep<cr>
--   5 nnoremap <silent> \\ <cmd>Telescope buffers<cr>
--   6 nnoremap <silent> \a <cmd>Telescope lsp_references<cr>
--   7 nnoremap <silent> \g <cmd>Telescope git_status<cr>
--   8 nnoremap <silent> ;t <cmd>Telescope help_tags<cr>
--   9 nnoremap <silent> ;d <cmd>Telescope file_browser<cr>
--  10 nnoremap <silent> ;u <cmd>cd %:h<cr>

-- keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
keymap("n", "<C-s>", "<cmd>vsplit<cr>", opts)
keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)
keymap("n", "<c-n>", ":e ~/Notes/<cr>", opts)

keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)
-- keymap("n", "<C-\\>", "<cmd>vsplit<cr>", opts)
-- vim.cmd[[nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]]
-- vim.cmd[[nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]]
-- keymap("n", "c*", [[/\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]], opts)
-- keymap("n", "c#", [[?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]], opts)
-- keymap("n", "x", [[:execute '!brave ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
-- Change '<CR>' to whatever shortcut you like :)
-- vim.api.nvim_set_keymap("n", "<CR>", "<cmd>NeoZoomToggle<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap(
  "n",
  "=",
  "<cmd>JABSOpen<cr>",
  { noremap = true, silent = true, nowait = true }
)

-- Split window
keymap("n", "<leader>s", "<cmd>split<Return><C-w>w", opts)
keymap("n", "<leader>v", "<cmd>vsplit<Return><C-w>w", opts)

-- Navegation buffers
keymap("n", "<leader>,", ":bp<cr>", opts)
keymap("n", "<leader>.", ":bn<cr>", opts)

-- Copy last record
keymap("n", "<leader>p", '"0p', opts)
keymap("n", "<leader>P", '"0P', opts)

-- Copy and recort selection to Xorg transfer area
keymap("n", "<leader>yy", '"+y', opts)
keymap("n", "<leader>dd", '"+c', opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Spells
keymap("", "<F2>", ":setlocal spell! spelllang=pt_br<cr>", opts)
keymap("", "<F3>", ":setlocal spell! spelllang=en<cr>", opts)
