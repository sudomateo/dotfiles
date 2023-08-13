local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set("n", "<leader>pt", builtin.lsp_document_symbols, {})

-- Clone the default Telescope configuration.
local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }

-- Add options to search hidden files in all directories except .git.
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

-- Configure telescope.
require("telescope").setup({
    defaults = {
        vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
        find_files = {
            -- Can this be updated to fall back to another tool when rg is not installed?
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
    },
})

require("telescope").load_extension("fzf")
