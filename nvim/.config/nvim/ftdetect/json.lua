vim.api.nvim_create_autocmd({
	"BufRead", "BufNewFile",
}, {
	pattern = {"*.tfstate", "*.tfstate.backup"},
	callback = function()
		vim.bo.filetype = "json"
	end,
})
