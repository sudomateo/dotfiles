return {
    {
        "ellisonleao/gruvbox.nvim",
        opts = {
            italic = {
                comments = true,
                emphasis = true,
                folds = true,
                operators = false,
                strings = false,
            },
        },
        config = function(_, opts)
            require("gruvbox").setup(opts)
            vim.cmd.colorscheme("gruvbox")
        end,
    },
}
