-- Install Packer plugin.
local packerInstallPath = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packerInstallPath)) ~= 0 then
	packerBootstrapped = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packerInstallPath})
end

-- Compile Packer plugin when this plugins.lua file is updated.
vim.cmd([[
	augroup packerPlugins
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

-- Install Vim plugins.
return require('packer').startup(
	function(use)
		use 'wbthomason/packer.nvim'
		use 'morhetz/gruvbox'
		use 'tpope/vim-commentary'
		use {
			'nvim-treesitter/nvim-treesitter',
			run = {
				':TSUpdate',
				':TSInstall bash c cmake cpp css dockerfile go gomod gowork hcl html javascript lua make python ruby rust typescript vim yaml',
			},
		}
		use 'neovim/nvim-lspconfig'
		use 'hrsh7th/nvim-cmp'
		use 'hrsh7th/cmp-nvim-lsp'
		use 'saadparwaiz1/cmp_luasnip'
		use 'L3MON4D3/LuaSnip'

		-- Execute PackerSync if the Packer plugin was just installed.
		if packerBootstrapped then
			require('packer').sync()
		end
	end
)
