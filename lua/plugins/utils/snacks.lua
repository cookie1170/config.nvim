return {
  'folke/snacks.nvim',
  opts = {
    input = {},
    picker = {},
    gh = {},
    explorer = {},
  },
  keys = {
    { '<leader>e', function() Snacks.explorer() end, desc = 'File [E]xplorer' },
    { '<leader>ghi', function() Snacks.picker.gh_issue() end, desc = '[G]it[H]ub [I]ssues (open)' },
    { '<leader>ghI', function() Snacks.picker.gh_issue { state = 'all' } end, desc = '[G]it[H]ub [I]ssues (all)' },
    { '<leader>ghp', function() Snacks.picker.gh_pr() end, desc = '[G]it[H]ub [P]ull Requests (open)' },
    { '<leader>ghP', function() Snacks.picker.gh_pr { state = 'all' } end, desc = '[G]it[H]ub [P]ull Requests (all)' },
  },
}
