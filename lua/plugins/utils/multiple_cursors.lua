return { -- Multiple cursors
  'brenton-leighton/multiple-cursors.nvim',
  opts = {
    -- Incompatible with nvim-autopairs
    pre_hook = function() require('nvim-autopairs').disable() end,
    post_hook = function() require('nvim-autopairs').enable() end,
  },
  keys = {
    { '<M-J>', '<Cmd>MultipleCursorsAddDown<CR>', mode = { 'n', 'x' }, desc = 'Add cursor and move down' },
    { '<M-K>', '<Cmd>MultipleCursorsAddUp<CR>', mode = { 'n', 'x' }, desc = 'Add cursor and move up' },

    { '<C-Up>', '<Cmd>MultipleCursorsAddUp<CR>', mode = { 'n', 'i', 'x' }, desc = 'Add cursor and move up' },
    { '<C-Down>', '<Cmd>MultipleCursorsAddDown<CR>', mode = { 'n', 'i', 'x' }, desc = 'Add cursor and move down' },

    { '<C-LeftMouse>', '<Cmd>MultipleCursorsMouseAddDelete<CR>', mode = { 'n', 'i' }, desc = 'Add or remove cursor' },

    { '<Leader>m', '<Cmd>MultipleCursorsAddVisualArea<CR>', mode = { 'x' }, desc = 'Add cursors to the lines of the visual area' },
    { '<Leader>l', '<Cmd>MultipleCursorsLock<CR>', mode = { 'n', 'x' }, desc = '[L]ock virtual cursors' },
    {
      '<S-CR>',
      function()
        vim.cmd 'MultipleCursorsAddDown'
        MiniJump2d.start()
      end,
      mode = { 'n', 'i', 'x' },
      desc = 'Add cursor and jump to label',
    },
  },
}
