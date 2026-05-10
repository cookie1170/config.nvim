vim.pack.add { gh 'ellisonleao/gruvbox.nvim' }

require('gruvbox').setup {
  contrast = 'soft',
}

-- load the colourscheme
vim.cmd.colorscheme 'gruvbox'
