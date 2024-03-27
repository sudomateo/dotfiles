return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                -- Skip installation is make isn't installed.
                cond = function()
                    return vim.fn.executable "make" == 1
                end,
            },
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            -- Enable Telescope extensions if they are installed.
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            vim.keymap.set("n", "<Leader>sh", require("telescope.builtin").help_tags, {
                desc = "Search help"
            })
            vim.keymap.set("n", "<Leader>sk", require("telescope.builtin").keymaps, {
                desc = "Search keymaps"
            })
            vim.keymap.set("n", "<Leader>sf", require("telescope.builtin").find_files, {
                desc = "Search files"
            })
            vim.keymap.set("n", "<Leader>ss", require("telescope.builtin").builtin, {
                desc = "Search builtin"
            })
            vim.keymap.set("n", "<Leader>sw", require("telescope.builtin").grep_string, {
                desc = "Search current word"
            })
            vim.keymap.set("n", "<Leader>sg", require("telescope.builtin").live_grep, {
                desc = "Search using grep"
            })
            vim.keymap.set("n", "<Leader>sd", require("telescope.builtin").diagnostics, {
                desc = "Search diagnostics"
            })
            vim.keymap.set("n", "<Leader>sr", require("telescope.builtin").resume, {
                desc = "Search resume"
            })
            vim.keymap.set("n", "<Leader>s.", require("telescope.builtin").oldfiles, {
                desc = "Search recent files"
            })
            vim.keymap.set("n", "<Leader><Leader>", require("telescope.builtin").buffers, {
                desc = "Search list of buffers"
            })

            vim.keymap.set("n", "<Leader>/",
                function()
                    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                    }))
                end,
                { desc = "Search inside current buffer" }
            )

            vim.keymap.set("n", "<Leader>s/",
                function()
                    require("telescope.builtin").live_grep({
                        grep_open_files = true,
                        -- prompt_title = "Live Grep in Open Files",
                    })
                end,
                { desc = "Search in open files" }
            )

            vim.keymap.set("n", "<Leader>sn",
                function()
                    require("telescope.builtin").find_files({
                        cwd = vim.fn.stdpath("config"),
                    })
                end,
                { desc = "Search Neovim files" }
            )
        end,
    },
}
