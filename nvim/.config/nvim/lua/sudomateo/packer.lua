local ensure_packer = function()
    local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Packer itself.
    use { "wbthomason/packer.nvim" }

    -- Gruvbox theme.
    use { "ellisonleao/gruvbox.nvim" }

    -- Telescope.
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = 'make'
    }

    -- Treesitter.
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use { "nvim-treesitter/nvim-treesitter-context" }
    use { "nvim-treesitter/playground" }

    -- LSP and autocomplete.
    use { "neovim/nvim-lspconfig" }
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }
    use { "hrsh7th/cmp-path" }
    use { "L3MON4D3/LuaSnip" }
    use { "saadparwaiz1/cmp_luasnip" }

    -- Mason.
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }

    -- General plugins.
    use { "theprimeagen/harpoon" }
    use { "mbbill/undotree" }
    use { "tpope/vim-fugitive" }
    use { "tpope/vim-commentary" }

    if packer_bootstrap then
        require("packer").sync()
    end
end)
