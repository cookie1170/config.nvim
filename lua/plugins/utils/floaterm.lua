return { -- Use :terminal in a floating window
  'voldikss/vim-floaterm',
  keys = {
    {
      '<leader>tt',
      ':FloatermToggle<CR>',
      desc = '[T]oggle a floating [T]erminal',
      silent = true,
    },
    {
      '<Esc><Esc>',
      '<C-\\><C-n>:FloatermKill<CR>',
      desc = 'Exit floating terminal',
      mode = 't',
      silent = true,
    },
  },
}
