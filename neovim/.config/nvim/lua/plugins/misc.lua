return {
    {
        "numToStr/Comment.nvim",
        opts = {},
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        keys = {
        },
        config = function()
            require("which-key").setup()

            require("which-key").add({
                { "<Leader>c",  group = "Code" },
                { "<Leader>c_", hidden = true },
                { "<Leader>d",  group = "Document" },
                { "<Leader>d_", hidden = true },
                { "<Leader>r",  group = "Rename" },
                { "<Leader>r_", hidden = true },
                { "<Leader>s",  group = "Search" },
                { "<Leader>s_", hidden = true },
                { "<Leader>w",  group = "Workspace" },
                { "<Leader>w_", hidden = true },
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.ai").setup({
                n_lines = 500
            })

            require("mini.surround").setup()

            require("mini.statusline").setup({
                use_icons = vim.g.have_nerd_font,
            })
        end,
    },
}
