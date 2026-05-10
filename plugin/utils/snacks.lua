vim.pack.add { gh 'folke/snacks.nvim' }

require('snacks').setup {
  input = { -- replaces the default `vim.ui.input`
    enabled = true,
  },
  picker = { -- a picker, required as a dep for `gh` and `explorer`
    enabled = true,
  },
  gh = { -- browse and edit github issues and pull requests
    enabled = true,
  },
  explorer = { -- a file explorer in the sidebar
    enabled = true,
  },
  bigfile = { -- makes neovim better at beeg files
    enabled = true,
  },
  indent = { -- indent guides
    enabled = true,
  },
  notifier = { -- prettier `vim.notify()`
    enabled = true,
    timeout = 3000,
  },
  dashboard = { -- a dashboard at startup
    enabled = true,
    preset = {
      pick = 'Telescope',
      keys = {
        { icon = ' ', key = 'f', desc = 'Find [F]ile', action = ':Telescope find_files' },
        { icon = '󰥨 ', key = 'd', desc = 'Find [D]irectory', action = ":lua require('telescope').extensions.zoxide.list()" },
        { icon = ' ', key = 'n', desc = '[N]ew File', action = ':ene | startinsert' },
        { icon = ' ', key = 'r', desc = '[R]ecent Files', action = ':Telescope oldfiles' },
        { icon = ' ', key = 'c', desc = '[C]onfig', action = ":lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath 'config' })" },
        { icon = ' ', key = 's', desc = 'Restore [S]ession', action = ':Persisted load_last' },
        { icon = ' ', key = 'q', desc = '[Q]uit', action = ':qa' },
      },
    },
    sections = {
      { section = 'header' },
      { section = 'keys', gap = 1, padding = 1 },
    },
  },
}

vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end, { desc = 'File [E]xplorer' })
vim.keymap.set('n', '<leader>ghi', function() Snacks.picker.gh_issue() end, { desc = '[G]it[H]ub [I]ssues (open)' })
vim.keymap.set('n', '<leader>ghI', function() Snacks.picker.gh_issue { state = 'all' } end, { desc = '[G]it[H]ub [I]ssues (all)' })
vim.keymap.set('n', '<leader>ghp', function() Snacks.picker.gh_pr() end, { desc = '[G]it[H]ub [P]ull Requests (open)' })
vim.keymap.set('n', '<leader>ghP', function() Snacks.picker.gh_pr { state = 'all' } end, { desc = '[G]it[H]ub [P]ull Requests (all)' })
