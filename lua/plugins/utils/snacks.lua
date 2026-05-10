return {
  'folke/snacks.nvim',
  priority = 10000,
  lazy = false,
  opts = {
    input = { enabled = true },
    picker = { enabled = true },
    gh = { enabled = true },
    explorer = { enabled = true },
    quickfile = { enabled = true },
    bigfile = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    dashboard = {
      enabled = true,
      preset = {
        pick = 'Telescope',
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ':Telescope find_files' },
          { icon = '󰥨 ', key = 'd', desc = 'Find Directory', action = ":lua require('telescope').extensions.zoxide.list()" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ':Telescope oldfiles' },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath 'config' })" },
          { icon = ' ', key = 's', desc = 'Restore Session', action = ':Persisted load_last' },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
    },
  },
  keys = {
    { '<leader>e', function() Snacks.explorer() end, desc = 'File [E]xplorer' },
    { '<leader>ghi', function() Snacks.picker.gh_issue() end, desc = '[G]it[H]ub [I]ssues (open)' },
    { '<leader>ghI', function() Snacks.picker.gh_issue { state = 'all' } end, desc = '[G]it[H]ub [I]ssues (all)' },
    { '<leader>ghp', function() Snacks.picker.gh_pr() end, desc = '[G]it[H]ub [P]ull Requests (open)' },
    { '<leader>ghP', function() Snacks.picker.gh_pr { state = 'all' } end, desc = '[G]it[H]ub [P]ull Requests (all)' },
  },
}
