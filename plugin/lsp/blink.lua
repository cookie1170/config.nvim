-- sets up blink, an autocompletion engine

vim.pack.add { { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' } }
require('blink.cmp').setup {
  keymap = {
    preset = 'default',
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',
  },

  completion = {
    -- show docs for items after half a second delay, or after `<C-space>`
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets' },
  },

  snippets = { preset = 'mini_snippets' },

  -- use the recommended rust fuzzy matcher
  fuzzy = { implementation = 'prefer_rust_with_warning' },

  -- shows a signature help window while you type arguments for a function
  signature = { enabled = true },
}
