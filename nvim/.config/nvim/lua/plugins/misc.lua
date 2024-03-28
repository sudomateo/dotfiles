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
        config = function()
            require("which-key").setup()

            require("which-key").register {
                ["<Leader>c"] = { name = "Code", _ = "which_key_ignore" },
                ["<Leader>d"] = { name = "Document", _ = "which_key_ignore" },
                ["<Leader>r"] = { name = "Rename", _ = "which_key_ignore" },
                ["<Leader>s"] = { name = "Search", _ = "which_key_ignore" },
                ["<Leader>w"] = { name = "Workspace", _ = "which_key_ignore" },
            }
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
