vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Import general configuration.
require("config")

-- Install the lazy plugin manager and add it to the front of the runtime path.
local lazy_install_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_install_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "git@github.com:folke/lazy.nvim",
        lazy_install_path,
    })
end
vim.opt.runtimepath:prepend(lazy_install_path)

-- Configure lazy to install plugins from `./lua/plugins`.
require("lazy").setup("plugins")
