vim.api.nvim_create_autocmd({
	"BufRead", "BufNewFile",
}, {
	pattern = {"*/.config/git/*"},
	callback = function()
		vim.bo.filetype = "gitconfig"
	end,
})
