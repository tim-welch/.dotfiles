-- Use packer.nvim for package managment
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    -- If packer not installed, clone it before configuring
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    print "Installing packer; close and reopen neovim..."
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packages.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
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

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Plugins used by lots of other plugins
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
    use "kyazdani42/nvim-web-devicons" -- Colored icons

    -- Plugins
    use 'nvim-telescope/telescope.nvim' -- fuzzy find
    use 'folke/which-key.nvim' -- menu
    use "goolord/alpha-nvim" -- Dashboard
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "akinsho/toggleterm.nvim" -- Toggle multiple terminals
    use "lewis6991/gitsigns.nvim" -- Show changes in sign column
    -- use "akinsho/bufferline.nvim" -- Customize tabs
    use "nvim-lualine/lualine.nvim" -- Customize status line
    use "numToStr/Comment.nvim" -- comment lines and blocks
    use "JoosepAlviste/nvim-ts-context-commentstring" -- comment code in another type of file
    use "folke/zen-mode.nvim" -- distraction free editing
    use "folke/twilight.nvim" -- dim text outside of current context

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { 'p00f/nvim-ts-rainbow', after = "nvim-treesitter" } -- colorful brackets
    use "lukas-reineke/indent-blankline.nvim" -- add guides

    -- LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "L3MON4D3/LuaSnip" --snippet engine
    use "onsails/lspkind.nvim" -- Add icons for LSP kinds
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Completion
    use 'hrsh7th/nvim-cmp' -- completion
    use 'hrsh7th/cmp-buffer' -- complete from current buffer
    use 'hrsh7th/cmp-path' -- complete paths
    use 'hrsh7th/cmp-cmdline' -- complete commandline (e.g. : and /)
    use 'hrsh7th/cmp-nvim-lsp' -- complete using LSP
    use "saadparwaiz1/cmp_luasnip" -- snippet completions

    -- Color schemes
    use "ellisonleao/gruvbox.nvim"
    use "norcalli/nvim-colorizer.lua" -- Highlight colors in their color

    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
