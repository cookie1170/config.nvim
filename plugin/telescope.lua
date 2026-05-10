-- sets up telescope, a fuzzy finder

local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then output = 'No output from build command.' end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      -- we need to build native code in order for telescope fzf to work
      run_build(name, { 'make' }, ev.data.path)
      return
    end
  end,
})

local telescope_plugins = {
  gh 'nvim-telescope/telescope.nvim',
  gh 'nvim-telescope/telescope-ui-select.nvim',
  gh 'jvgrootveld/telescope-zoxide',
}

if vim.fn.executable 'make' == 1 then table.insert(telescope_plugins, gh 'nvim-telescope/telescope-fzf-native.nvim') end

vim.pack.add(telescope_plugins)

require('telescope').setup {
  extensions = {
    ['ui-select'] = { require('telescope.themes').get_dropdown() },
    zoxide = {
      mappings = {
        default = {
          after_action = function() Snacks.explorer() end,
        },
      },
    },
  },
}

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
pcall(require('telescope').load_extension, 'zoxide')
pcall(require('telescope').load_extension, 'persisted')

-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set({ 'n', 'v' }, '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = '[ ] Search Files' })
vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<CR>', { desc = '[S]earch [T]odos', silent = true })
vim.keymap.set('n', '<leader>sD', require('telescope').extensions.zoxide.list, { desc = '[S]earch [D]irectories', silent = true })

-- This runs on LSP attach per buffer (see main LSP attach function in 'neovim/nvim-lspconfig' config for more info,
-- it is better explained there). This allows easily switching between pickers if you prefer using something else!
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Find references for the word under your cursor.
    map('grr', builtin.lsp_references, '[G]oto [R]eferences')

    -- Jump to the implementation of the word under your cursor.
    -- Useful when your language has ways of declaring types without an actual implementation.
    map('gri', builtin.lsp_implementations, '[G]oto [I]mplementation')

    -- Jump to the definition of the word under your cursor.
    -- This is where a variable was first declared, or where a function is defined, etc.
    -- To jump back, press <C-t>.
    map('grd', builtin.lsp_definitions, '[G]oto [D]efinition')
    map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')

    -- Fuzzy find all the symbols in your current document.
    -- Symbols are things like variables, functions, types, etc.
    map('go', builtin.lsp_document_symbols, 'Open document [O]utline')

    -- Fuzzy find all the symbols in your current workspace.
    -- Similar to document symbols, except searches over your entire project.
    map('gW', builtin.lsp_dynamic_workspace_symbols, 'Open [W]orkspace symbols')

    -- Jump to the type of the word under your cursor.
    -- Useful when you're not sure what type a variable is and you want to see
    -- the definition of its *type*, not where it was *defined*.
    map('grt', builtin.lsp_type_definitions, '[G]oto [T]ype definition')
  end,
})

-- Override default behavior and theme when searching
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set(
  'n',
  '<leader>s/',
  function()
    builtin.live_grep {
      grep_open_files = true,
      prompt_title = 'Live Grep in Open Files',
    }
  end,
  { desc = '[S]earch [/] in Open Files' }
)

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end, { desc = '[S]earch [n]eovim files' })
