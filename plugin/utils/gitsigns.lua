-- adds git related signs to the gutter, as well as utilities for managing changes

vim.pack.add { gh 'lewis6991/gitsigns.nvim' }
require('gitsigns').setup {
  signs = {
    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
  },
  on_attach = function(bufnr)
    local gitsigns = require 'gitsigns'

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Next change' })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Previous change' })

    -- actions
    map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[G]it: [S]tage hunk' })
    map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[G]it: [R]eset hunk' })

    map('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[G]it: [S]tage hunk' })

    map('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[G]it: [R]eset hunk' })

    map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[G]it: [S]tage buffer' })
    map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[G]it: [R]eset buffer' })
    map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[G]it: [P]review hunk' })
    map('n', '<leader>gI', gitsigns.preview_hunk_inline, { desc = '[G]it: Preview hunk [I]nline' })

    map('n', '<leader>gb', function() gitsigns.blame_line { full = true } end, { desc = '[G]it: [B]lame line' })
    map('n', '<leader>gB', gitsigns.blame, { desc = '[G]it: Open [B]lame' })

    map('n', '<leader>gd', gitsigns.diffthis, { desc = '[G]it: [D]iff this' })
    map('n', '<leader>gD', function() gitsigns.diffthis '~' end, { desc = '[G]it: [D]iff parent' })

    map('n', '<leader>gq', gitsigns.setqflist, { desc = '[G]it: [Q]uickfix list' })
    map('n', '<leader>gQ', function() gitsigns.setqflist 'all' end, { desc = '[G]it: [Q]uickfix list all' })

    -- toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle line [B]lame' })
    map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = '[T]oggle [W]ord diff' })

    -- text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'inner hunk' })
  end,
}
