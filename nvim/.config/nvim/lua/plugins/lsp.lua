return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Mason manages installation of LSP tooling.
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            -- Status updates for LSP.
            { "j-hui/fidget.nvim", opts = {} },

            -- Lua LSP configuration for Neovim configuration, runtime, plugins, and APIs.
            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, {
                        buffer = event.buf,
                        desc = "Go to definition",
                    })

                    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {
                        buffer = event.buf,
                        desc = "Go to references",
                    })

                    vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, {
                        buffer = event.buf,
                        desc = "Go to implementation",
                    })

                    vim.keymap.set("n", "<Leader>D", require("telescope.builtin").lsp_type_definitions, {
                        buffer = event.buf,
                        desc = "Go to type definition",
                    })

                    vim.keymap.set("n", "<Leader>ds", require("telescope.builtin").lsp_document_symbols, {
                        buffer = event.buf,
                        desc = "Search document symbols",
                    })

                    vim.keymap.set("n", "<Leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, {
                        buffer = event.buf,
                        desc = "Search workspace symbols",
                    })

                    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, {
                        buffer = event.buf,
                        desc = "Rename variable",
                    })

                    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {
                        buffer = event.buf,
                        desc = "List code actions",
                    })

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, {
                        buffer = event.buf,
                        desc = "Show documentation for symbol under cursor",
                    })

                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
                        buffer = event.buf,
                        desc = "Go to declaration",
                    })

                    local lsp_client = vim.lsp.get_client_by_id(event.data.client_id)
                    if lsp_client and lsp_client.server_capabilities.documentHighlightProvider then
                        -- Highlight references for the symbol under the cursor while the cursor is paused.
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        -- Clear the highlights when the cursor resumes moving.
                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            -- A table of LSP servers to their configuration options.
            -- Adding an LSP server here configures it automatically.
            local lsp_servers = {
                gopls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
                rust_analyzer = {},
            }

            -- Mason is used to install LSP tooling.
            require("mason").setup()

            -- Install LSP tooling.
            local ensure_installed = vim.tbl_keys(lsp_servers or {})
            vim.list_extend(ensure_installed, {
                "stylua", -- To format Lua code.
            })
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

            -- Configure the LSP servers.
            require("mason-lspconfig").setup({
                handlers = {
                    function(name)
                        local opts = lsp_servers[name] or {}
                        opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
                        require("lspconfig")[name].setup(opts)
                    end,
                },
            })
        end,
    },
}
