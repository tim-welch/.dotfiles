-- Tabs
vim.bo.expandtab = true  -- expand tabs to spaces
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

-- Key binding helpers
local keymap = vim.api.nvim_set_keymap
local noremap = { noremap = true }

-- CTRL-j,k,h,l move between windows
keymap('n', '<c-j>', '<c-w>j', noremap)
keymap('n', '<c-k>', '<c-w>k', noremap)
keymap('n', '<c-h>', '<c-w>h', noremap)
keymap('n', '<c-l>', '<c-w>l', noremap)

-- Use packer.nvim for package managment
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    -- If packer not installed, clone it before configuring
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Put plugins here

    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)


