return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                "css",
                "csv",
                "dockerfile",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "gomod",
                "gosum",
                "gotmpl",
                "gowork",
                "hcl",
                "html",
                "ini",
                "javascript",
                "jq",
                "json",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "mermaid",
                "proto",
                "python",
                "sql",
                "terraform",
                "tmux",
                "toml",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml",

            },
            auto_install = true,
            highlight = {
                enable = true,
                -- Some languages, such as Ruby, depend on Neovim's regular expression
                -- highlighting system. If a language demonstrates indenting issues, add
                -- it to "additional_vim_regex_highlighting" and "indent.disable" below.
                additional_vim_regex_highlighting = { "ruby" },
            },
            indent = {
                enable = true,
                disable = { "ruby" },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
