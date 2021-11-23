vim.cmd([[
	silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
	autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
	autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl
	autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
]])
