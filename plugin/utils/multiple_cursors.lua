-- a plugin for multiple cursors
vim.pack.add { gh 'brenton-leighton/multiple-cursors.nvim' }
require('multiple-cursors').setup {
  -- incompatible with nvim-autopairs
  pre_hook = function() require('nvim-autopairs').disable() end,
  post_hook = function() require('nvim-autopairs').enable() end,
}
vim.keymap.set({ 'n', 'x' }, '<M-J>', '<Cmd>MultipleCursorsAddDown<CR>', { silent = true, desc = 'Add cursor and move down' })
vim.keymap.set({ 'n', 'x' }, '<M-K>', '<Cmd>MultipleCursorsAddUp<CR>', { silent = true, desc = 'Add cursor and move up' })

vim.keymap.set({ 'n', 'i', 'x' }, '<C-Up>', '<Cmd>MultipleCursorsAddUp<CR>', { silent = true, desc = 'Add cursor and move up' })
vim.keymap.set({ 'n', 'i', 'x' }, '<C-Down>', '<Cmd>MultipleCursorsAddDown<CR>', { silent = true, desc = 'Add cursor and move down' })
vim.keymap.set({ 'n', 'i' }, '<C-LeftMouse>', '<Cmd>MultipleCursorsMouseAddDelete<CR>', { silent = true, desc = 'Add or remove cursor' })

vim.keymap.set({ 'x' }, '<Leader>m', '<Cmd>MultipleCursorsAddVisualArea<CR>', { silent = true, desc = 'Add cursors to the lines of the visual area' })
vim.keymap.set({ 'n', 'x' }, '<Leader>l', '<Cmd>MultipleCursorsLock<CR>', { silent = true, desc = '[L]ock virtual cursors' })

-- useful for placing cursors in specific spots
vim.keymap.set({ 'n', 'i', 'x' }, '<S-CR>', function()
  vim.cmd 'MultipleCursorsAddDown'
  MiniJump2d.start()
end, { silent = true, desc = 'Add cursor and jump to label' })
