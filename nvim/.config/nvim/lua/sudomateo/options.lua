-- Look and feel.
vim.opt.background = "dark"
vim.opt.colorcolumn = { 81, 121 }
vim.opt.cursorline = true
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.wrap = false

-- Spaces and tabs.
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Swap.
vim.opt.directory = vim.fn.stdpath("data") .. "/swap"
vim.opt.swapfile = false

-- Undo.
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true

-- Format options.
vim.opt.formatoptions = vim.opt.formatoptions + "c"
vim.opt.formatoptions = vim.opt.formatoptions + "r"
vim.opt.formatoptions = vim.opt.formatoptions + "q"
vim.opt.formatoptions = vim.opt.formatoptions + "n"
vim.opt.formatoptions = vim.opt.formatoptions + "j"
vim.opt.formatoptions = vim.opt.formatoptions - "t"
vim.opt.formatoptions = vim.opt.formatoptions - "o"
vim.opt.formatoptions = vim.opt.formatoptions - "a"
vim.opt.formatoptions = vim.opt.formatoptions - "2"

-- General settings.
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.diffopt = { "filler", "closeoff", "hiddenoff", "internal", "algorithm:minimal" }
vim.opt.foldmethod = "marker"
vim.opt.inccommand = "split"
vim.opt.wildmode = "longest:full"
