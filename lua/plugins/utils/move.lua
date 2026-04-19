return {
  'fedepujol/move.nvim',
  keys = {
    -- Normal Mode
    { '<A-j>', '<cmd>MoveLine(1)<CR>', mode = { 'n', 'i' }, desc = 'Move Line Up', silent = true },
    { '<A-k>', '<cmd>MoveLine(-1)<CR>', mode = { 'n', 'i' }, desc = 'Move Line Down', silent = true },
    { '<A-h>', '<cmd>MoveWord(-1)<CR>', mode = { 'n', 'i' }, desc = 'Move Word Left', silent = true },
    { '<A-l>', '<cmd>MoveWord(1)<CR>', mode = { 'n', 'i' }, desc = 'Move Word Right', silent = true },
    -- Visual Mode
    { '<A-j>', '<cmd>MoveBlock(1)<CR>', mode = { 'v' }, desc = 'Move Block Up', silent = true },
    { '<A-k>', '<cmd>MoveBlock(-1)<CR>', mode = { 'v' }, desc = 'Move Block Down', silent = true },
    { '<A-h>', '<cmd>MoveHBlock(-1)<CR>', mode = { 'v' }, desc = 'Move Block Left', silent = true },
    { '<A-l>', '<cmd>MoveHBlock(1)<CR>', mode = { 'v' }, desc = 'Move Block Right', silent = true },
  },
  opts = {},
}
