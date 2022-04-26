function go_imports(timeout_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = {only = {"source.organizeImports"}}
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop= 4
vim.opt_local.tabstop = 4

vim.cmd([[
	autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
	autocmd BufWritePre *.go :silent! lua go_imports(3000)
]])
