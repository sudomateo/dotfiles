vim.api.nvim_create_autocmd({
	"BufRead", "BufNewFile",
}, {
	pattern = {"*.tfvars"},
	callback = function()
		vim.bo.filetype = "terraform-vars"
	end,
})
