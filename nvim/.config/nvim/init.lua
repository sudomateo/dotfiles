require('plugins')
require('options')
require('lsp')

vim.cmd([[
  try
    colorscheme gruvbox
  catch
    colorscheme default
  endtry
]])

vim.keymap.set("", "<C-p>", require('telescope.builtin').find_files)
vim.keymap.set("", "<C-f>", require('telescope.builtin').live_grep)
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>")

vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark = 'medium'
vim.g.gruvbox_contrast_light = 'light'

vim.cmd([[
  filetype plugin indent on
  syntax on
]])

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.hcl.filetype_to_parsername = "terraform"

local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {},
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
}

require('telescope').load_extension('fzf')
