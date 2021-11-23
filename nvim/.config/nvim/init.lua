require('plugins')
require('options')
require('lsp')

vim.cmd([[
	try
		colorscheme gruvbox
	catch
		colorschem default
	endtry
]])

vim.cmd([[
	noremap <silent><leader>/ :nohlsearch<cr>
]])

vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark='medium'
vim.g.gruvbox_contrast_light='light'

vim.cmd([[
	filetype plugin indent on
	syntax on
]])

require('nvim_comment').setup()

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.hcl.used_by = "terraform"
