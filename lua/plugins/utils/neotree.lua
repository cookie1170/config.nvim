return { -- A file picker
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {},
  keys = {
    {
      '<leader>n',
      '<cmd>Neotree<CR>',
      desc = 'Focus [n]eo-tree',
      silent = true,
    },
  },
}
