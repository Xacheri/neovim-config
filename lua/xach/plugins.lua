local fn = vim.fn

-- check if windows or not, by if Program Files exists (hope wsl doesnt confuse it)
local is_windows = vim.fn.isdirectory("C:/Program Files") == 1
local install_path = is_windows and vim.fn.stdpath('data') .. '\\site\\pack\\packer\\start\\packer.nvim' or vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim' -- do an intentional oopsies and execute in the condo to mimic ternary


if not vim.fn.isdirectory(install_path) then
  vim.fn.mkdir(install_path, 'p')
  local install_cmd = string.format('!git clone --depth 1 https://github.com/wbthomason/packer.nvim %s', install_path)
  vim.api.nvim_command(install_cmd)
  vim.api.nvim_command('packadd packer.nvim')
end


-- Use a prtected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end


-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- define packer plugins in startup function returned as our export
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = {
      {
        'nvim-lua/plenary.nvim'
      },
      {
        'nvim-tree/nvim-web-devicons'
      }
    }
  }
  -- color scheme
  use "EdenEast/nightfox.nvim"
  use "bluz71/vim-moonfly-colors"

  -- cmp autocomplete
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  -- use "github/copilot.vim" -- eh f copilot

  -- snippet stuff
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets"

  -- LSP 
  use "antosha417/nvim-lsp-file-operations"
  use "neovim/nvim-lspconfig"
  use "stevearc/dressing.nvim" -- use telescope for many input output things
  use {
    'williamboman/mason.nvim',
  }
  use { 'williamboman/mason-lspconfig.nvim' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'prichrd/netrw.nvim'

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'p00f/nvim-ts-rainbow'
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
