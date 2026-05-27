local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "folke/which-key.nvim",
  "nvim-lua/plenary.nvim",
  "Shougo/defx.nvim",

  -- Telescope
  "nvim-telescope/telescope.nvim",
  "tom-anders/telescope-vim-bookmarks.nvim",
  "nvim-telescope/telescope-media-files.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },
  -- use 'p00f/nvim-ts-rainbow'


  -- Icons
  "kyazdani42/nvim-web-devicons",
  "onsails/lspkind.nvim",

  -- LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "tamago324/nlsp-settings.nvim",
  "nvimtools/none-ls.nvim",
  "filipdutescu/renamer.nvim",
  "simrat39/symbols-outline.nvim",
  "ray-x/lsp_signature.nvim",
  "b0o/SchemaStore.nvim",
  -- use {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- }
  "RRethy/vim-illuminate",
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  -- CMP
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- Color 
  "brenoprata10/nvim-highlight-colors",

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  { "catppuccin/nvim", name = "catppuccin" },
  { "projekt0n/github-nvim-theme", lazy = true },
  { "rafamadriz/neon", lazy = true },
  { "sainnhe/sonokai", lazy = true },
  { "marko-cerovac/material.nvim", lazy = true },
  "nvim-lualine/lualine.nvim",

  -- Transparencia
  "xiyaowong/nvim-transparent",

  -- Git diff in the sign column
  "lewis6991/gitsigns.nvim",
  -- use {
  --   'pwntester/octo.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --     -- OR 'ibhagwan/fzf-lua',
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   config = function ()
  --     require"octo".setup()
  --   end
  -- }
  -- use 'tpope/vim-fugitive'
  -- use 'airblade/vim-gitgutter'

  -- Motion
  {
    'smoka7/hop.nvim',
    tag = '*', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },

  -- emmet expand html
  "mattn/emmet-vim",

  -- autopairs
  "windwp/nvim-autopairs",

  -- Popup
  "nvim-lua/popup.nvim",

  -- Markdown preview
  -- use({
  --     "iamcco/markdown-preview.nvim",
  --     run = function() vim.fn["mkdp#util#install"]() end,
  -- })

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = "cd app && npm install",
  },

  -- Snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- Commentary
  "tpope/vim-commentary",

  -- Clipboard
  "AckslD/nvim-neoclip.lua",
  { "ojroques/nvim-osc52" },

  -- Surround
  "Mephistophiles/surround.nvim",

  -- Latex
  {
    "xuhdev/vim-latex-live-preview",
    ft = { "tex", "plaintex", "bib" },
  },
  {
    "lervag/vimtex",
    ft = { "tex", "plaintex", "bib" },
  },

  -- Ranger in neovim
  -- use 'kevinhwang91/rnvimr'
  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({ replace_netrw = true })
      vim.api.nvim_set_keymap("n", "<leader>ef", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })
    end,
  },

  -- Theme Startify
  {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },

  -- Terminal
  {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end},

  -- jupyter
  {
    "kiyoon/jupynium.nvim",
    cmd = { "JupyniumStartSync", "JupyniumStopSync", "JupyniumKernelSelect" },
    ft = { "python" },
    build = "pip3 install --user .",
  },

  "rcarriga/nvim-notify",
  "stevearc/dressing.nvim",

  -- ipython 
  { "Vigemus/iron.nvim", ft = { "python" } },

 -- jupyter notebook
  {
    "benlubas/molten-nvim",
    ft = { "python", "quarto", "markdown" },
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_output_win_max_height = 12
    end,
  },

  { "GCBallesteros/jupytext.nvim", ft = { "python", "markdown" } },
  { "nvim-pack/nvim-spectre", cmd = "Spectre" },

  -- chatgpt
  {
    "jackMort/ChatGPT.nvim",
    cmd = {
      "ChatGPT",
      "ChatGPTActAs",
      "ChatGPTCompleteCode",
      "ChatGPTEditWithInstructions",
    },
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

  -- avante
  -- Required plugins
  "MunifTanjim/nui.nvim",
  "MeanderingProgrammer/render-markdown.nvim",

  -- Optional dependencies
  "HakonHarnes/img-clip.nvim",
  "zbirenbaum/copilot.lua",
  "folke/snacks.nvim",

  -- Avante.nvim with build process
  -- use {
  --   'yetone/avante.nvim',
  --   branch = 'main',
  --   run = "make BUILD_FROM_SOURCE=true",
  -- i}


  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "stevearc/dressing.nvim",
    },
    opts = {
      provider = "openai",
      providers = {
        openai = {
          model = "gpt-5-nano",
          extra_request_body = {
            temperature = 0.7,
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  },
}, {
  defaults = {
    lazy = false,
  },
  install = {
    colorscheme = { "catppuccin", "habamax" },
  },
  checker = {
    enabled = false,
  },
})
