vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Import general configuration.
require("config")

-- Install the lazy plugin manager and add it to the front of the runtime path.
local lazy_install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazy_install_path) then
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "git@github.com:folke/lazy.nvim",
        lazy_install_path,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.runtimepath:prepend(lazy_install_path)

-- Configure lazy to install plugins from `./lua/plugins`.
require("lazy").setup("plugins")
