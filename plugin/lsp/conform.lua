-- sets up conform, a formatter

vim.pack.add { gh 'stevearc/conform.nvim' }

require('conform').setup {
  notify_on_error = true,

  format_on_save = function(bufnr)
    -- disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
    return { timeout_ms = 500, lsp_format = 'fallback' }
  end,

  default_format_opts = {
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    lua = { 'stylua' },
  },
}

vim.keymap.set('n', '<leader>tf', ':FormatToggle<CR>', {
  desc = '[T]oggle [F]ormat-on-save',
  silent = true,
})

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- `FormatDisable!` will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

vim.api.nvim_create_user_command('FormatToggle', function(args)
  if vim.b.disable_autoformat or vim.g.disable_autoformat then
    vim.cmd 'FormatEnable'
  else
    if args.bang then
      vim.cmd 'FormatDisable!'
    else
      vim.cmd 'FormatDisable'
    end
  end
end, { desc = 'Toggle autoformat-on-save', bang = true })
