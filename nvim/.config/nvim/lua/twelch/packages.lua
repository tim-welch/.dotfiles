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



