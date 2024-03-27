-- Clear the highlighting from "hlsearch".
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps.
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- Disable arrow keys to force hjkl movement.
vim.keymap.set("n", "<left>", "")
vim.keymap.set("n", "<down>", "")
vim.keymap.set("n", "<up>", "")
vim.keymap.set("n", "<right>", "")

-- Use Control+hjkl for window switching. See `:help wincmd`.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to window to the left of the current one" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to window below the current one" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to window above the current one" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to window to the right of the current one" })

--  Highlight yanked text. See `:help vim.highlight.on_yank()`.
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("text-yank-post", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- TODO: Check if we need these mappings.
-- -- Move selected lines up and down.
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
--
-- vim.keymap.set("x", "<leader>p", "\"_dP")
--
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")
--
-- vim.keymap.set("n", "<leader>d", "\"_d")
-- vim.keymap.set("v", "<leader>d", "\"_d")
--
-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", function()
--     vim.lsp.buf.format()
-- end)
--
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--
-- vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.lsp.buf.code_action({
--         apply = true,
--         context = {
--             only = {
--                 "source.organizeImports"
--             },
--         },
--     })
-- end)
