-- If we opened any files, don't do this
if #vim.v.argf > 0 then return end

vim.api.nvim_create_autocmd('VimEnter', { callback = require('telescope').extensions.zoxide.list })
