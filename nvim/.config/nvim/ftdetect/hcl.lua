vim.api.nvim_create_autocmd({
	"BufRead", "BufNewFile",
}, {
	pattern = {"*.hcl", ".terraformrc", "terraform.rc"},
	callback = function()
		vim.bo.filetype = "hcl"
	end,
})
