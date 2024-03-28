vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldmethod = "marker"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.list = true
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250
vim.opt.wildmode = "longest:full"
vim.opt.wrap = true

vim.opt.colorcolumn = {
    "+1", -- One column after "textwidth".
}

vim.opt.completeopt = {
    "menu",     -- Use a popup menu.
    "preview",  -- Show extra information about the selected item.
    "noselect", -- Do not select an item until the user explicitly selects one.
}

vim.opt.diffopt = {
    "filler",           -- Show filler lines to keep text aligned.
    "closeoff",         -- Turn off diff mode when all other windows with diff mode enabled are closed.
    "hiddenoff",        -- Do not use diff mode for a hidden buffer.
    "internal",         -- Use internal diff library.
    "algorithm:minimal" -- Use extra time to generate a minimal diff.
}

vim.opt.formatoptions:append("c") -- Automatically wrap comments.
vim.opt.formatoptions:append("j") -- Remove comment leader when joining lines.
vim.opt.formatoptions:append("n") -- Recognize numbered lists. Requires "autoindent".
vim.opt.formatoptions:append("q") -- Format comments using "gq".
vim.opt.formatoptions:append("r") -- Insert comment leader after <Enter>.
vim.opt.formatoptions:remove("t") -- Do not automatically wrap text.

vim.opt.swapfile = true
vim.opt.directory = {
    vim.fn.stdpath("data") .. "/swap",
}

vim.opt.undofile = true
vim.opt.undodir = {
    vim.fn.stdpath("data") .. "/undo",
}
