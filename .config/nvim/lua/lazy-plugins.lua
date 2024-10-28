-- [[ Run install for Lazy ]]
require('lazy').setup({
    'tpope/vim-sleuth',          -- Detect tabstop and shiftwidth automatically
    require 'plugins/autopairs', -- autopairs
    require 'plugins/cmp',       -- autocompletions
    -- require 'plugins/nvim-tree'  -- nvim-tree file explorer
    require 'plugins/neo-tree',   -- neo-tree file explorer
    require 'plugins/conform',    -- autoformatter
    require 'plugins/gitsigns',   -- gitsigns
    require 'plugins/telescope',  -- telescope
}, 
    {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
