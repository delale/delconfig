-- vim: ts=2 sts=2 sw=2 et

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- cursorline
vim.opt.cursorline = true

-- mode
-- vim.opt.showmode = false

-- mouse mode
vim.opt.mouse = 'a'

-- enable sharing sys clipboard
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)

-- breakindent
vim.opt.breakindent = true

-- default tab behaviour
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- autoindents
vim.opt.autoindent = true
vim.opt.shiftwidth = 4

-- faster scrolling
vim.opt.ttyfast = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true  -- unless \C or >1 capital letters

-- search highlighting
vim.opt.hlsearch = true
-- incremental search
vim.opt.incsearch = true

-- Sign column
vim.opt.signcolumn = 'yes'

-- color column
vim.opt.colorcolumn = "80"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- -> diplays which-key sooner
vim.opt.timeoutlen = 300

-- Splits configuration
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Special chars
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = '·', nbsp = '␣' }

-- Preview substitutions
vim.opt.inccommand = 'split'

-- Miminal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10
