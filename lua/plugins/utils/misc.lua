return {
  { 'NMAC427/guess-indent.nvim', opts = {} },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    ---@module 'gitsigns'
    ---@type Gitsigns.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
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

        -- Navigation
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

        -- Actions
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

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle line [B]lame' })
        map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = '[T]oggle [W]ord diff' })

        -- Text object
        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'inner hunk' })
      end,
    },
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    ---@module 'which-key'
    ---@type wk.Opts
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      delay = 0,
      icons = { mappings = vim.g.have_nerd_font },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
        { '<leader>gh', group = '[G]it[H]ub', mode = { 'n' } },
        { 'gr', group = 'LSP Actions', mode = { 'n' } },
      },
    },
    keys = {
      { '<C-?>', ':WhichKey<CR>', silent = true, mode = { 'n', 'v', 'i' } },
    },
  },

  { -- Plugin for resolving git merge conflicts
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true,
  },

  {
    -- Highlight todo, notes, etc in comments:
    -- PERF:
    -- TEST:
    -- NOTE:
    -- TODO:
    -- WARN:
    -- HACK:
    -- FIXME:
    -- REMOVE:
    -- SAFETY:
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ---@module 'todo-comments'
    ---@type TodoOptions
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      keywords = {
        FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', color = 'test', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        SAFETY = { color = 'error' },
        REMOVE = { icon = ' ', color = 'error' },
      },
    },
  },

  { -- Automatically close character pairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  {
    'norcalli/nvim-colorizer.lua',
    event = 'VimEnter',
    keys = { { '<leader>tc', ':ColorizerToggle<CR>', silent = true, mode = { 'n' }, desc = '[T]oggle [C]olorizer' } },
    opts = {},
  },
}
