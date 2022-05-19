vim.api.nvim_create_autocmd({
	"BufRead", "BufNewFile",
}, {
	group = filetypedetect_id,
	pattern = {"*.hcl", ".terraformrc", "terraform.rc"},
	callback = function()
		vim.bo.filetype = "hcl"
	end,
})
