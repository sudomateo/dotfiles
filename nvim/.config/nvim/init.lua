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

vim.cmd([[
  noremap <silent><leader>/ :nohlsearch<cr>
]])

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
  -- mapping = {
  --   ['<C-p>'] = cmp.mapping.select_prev_item(),
  --   ['<C-n>'] = cmp.mapping.select_next_item(),
  --   ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  --   ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --   ['<C-Space>'] = cmp.mapping.complete(),
  --   ['<C-e>'] = cmp.mapping.close(),
  --   ['<CR>'] = cmp.mapping.confirm {
  --     behavior = cmp.ConfirmBehavior.Replace,
  --     select = true,
  --   },
  --   ['<Tab>'] = function(fallback)
  --     if cmp.visible() then
  --       cmp.select_next_item()
  --     elseif luasnip.expand_or_jumpable() then
  --       luasnip.expand_or_jump()
  --     else
  --       fallback()
  --     end
  --   end,
  --   ['<S-Tab>'] = function(fallback)
  --     if cmp.visible() then
  --       cmp.select_prev_item()
  --     elseif luasnip.jumpable(-1) then
  --       luasnip.jump(-1)
  --     else
  --       fallback()
  --     end
  --   end,
  -- },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
}

require('telescope').load_extension('fzf')
