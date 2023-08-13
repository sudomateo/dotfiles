require("gruvbox").setup({
    italic = {
        strings = false,
    },
})

vim.cmd.colorscheme("gruvbox")

-- I don't remember why I made this change so I commented it out to see what breaks.
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
