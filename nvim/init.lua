-- =======================
-- Basic Neovim settings
-- =======================
vim.o.number = true
vim.o.relativenumber = false
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.clipboard = "unnamedplus"
-- vim.o.termguicolors = true

-- =======================
-- Plugin manager (packer)
-- =======================
require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- Popular themes
  use { 'navarasu/onedark.nvim' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'folke/tokyonight.nvim' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'rebelot/kanagawa.nvim' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'morhetz/gruvbox' }

  -- Treesitter for syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- LSP + autocomplete
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  -- UI / Status line / Icons
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Fuzzy finder
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

  -- Git integration
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Error highlighting
  use 'folke/trouble.nvim'
end)

-- Theme setup (Lua-based themes)
require('onedark').setup { style = 'darker' }
require('catppuccin').setup { flavour = 'mocha' }
require('tokyonight').setup { style = 'storm' }
require('nightfox').setup {}           -- default style
require('kanagawa').setup {}            -- default style
require('rose-pine').setup { variant = 'main' }

-- vim.o.termguicolors = true
vim.g.gruvbox_contrast_dark = "hard"
vim.cmd("colorscheme gruvbox")


-- =======================
-- Treesitter configuration
-- =======================
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "python", "javascript", "lua" },
  highlight = { enable = true },
}

-- =======================
-- LSP + Autocomplete
-- =======================
local nvim_lsp = require('lspconfig')
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
})

-- Example: setup pyright for Python
nvim_lsp.pyright.setup{}
nvim_lsp.ts_ls.setup{}
nvim_lsp.clangd.setup{}
nvim_lsp.gopls.setup{}
nvim_lsp.rust_analyzer.setup{}

-- =======================
-- Lualine (status line)
-- =======================
require('lualine').setup {
  options = { theme = 'gruvbox', section_separators = '', component_separators = '' }
}

-- =======================
-- Nvim Tree
-- =======================
require'nvim-tree'.setup {}

-- =======================
-- Gitsigns
-- =======================
require('gitsigns').setup()

