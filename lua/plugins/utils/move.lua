return {
  'fedepujol/move.nvim',
  keys = {
    -- Normal Mode
    { '<A-j>', function() require('move.core.vert').moveLine(1, false) end, mode = { 'n', 'i' }, desc = 'Move Line Up' },
    { '<A-k>', function() require('move.core.vert').moveLine(-1, false) end, mode = { 'n', 'i' }, desc = 'Move Line Down' },
    { '<A-h>', function() require('move.core.horiz').horzWord(-1) end, mode = { 'n', 'i' }, desc = 'Move Word Left' },
    { '<A-l>', function() require('move.core.horiz').horzWord(1) end, mode = { 'n', 'i' }, desc = 'Move Word Right' },
    -- Visual Mode
    { '<A-j>', '<cmd>MoveBlock(1)<CR>', mode = { 'v' }, desc = 'Move Block Up', silent = true },
    { '<A-k>', '<cmd>MoveBlock(-1)<CR>', mode = { 'v' }, desc = 'Move Block Down', silent = true },
    { '<A-h>', '<cmd>MoveHBlock(-1)<CR>', mode = { 'v' }, desc = 'Move Block Left', silent = true },
    { '<A-l>', '<cmd>MoveHBlock(1)<CR>', mode = { 'v' }, desc = 'Move Block Right', silent = true },
  },
  opts = {},
}
