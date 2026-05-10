-- enable faster startup by caching compiled lua modules
vim.loader.enable()

-- options
require 'opts'

-- keymap
require 'keymap'

-- miscellanious changes
require 'misc'

-- adds some global utility functions
require 'utils'
