vim.api.nvim_create_autocmd({
	"BufRead", "BufNewFile",
}, {
	group = filetypedetect_id,
	pattern = {"*/.config/git/*"},
	callback = function()
		vim.bo.filetype = "gitconfig"
	end,
})
