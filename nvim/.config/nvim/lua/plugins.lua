-- Install Packer plugin.
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
	packer_bootstrapped = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path})
end

-- Compile Packer plugin when this plugins.lua is updated.
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

-- Install Vim plugins.
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'morhetz/gruvbox'
	use 'terrortylor/nvim-comment'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = {
			':TSUpdate',
			':TSInstall go',
			':TSInstall hcl',
		},
	}
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'

	-- Execute PackerSync if the Packer plugin was just installed.
	if packer_bootstrapped then
		require('packer').sync()
	end
end)
