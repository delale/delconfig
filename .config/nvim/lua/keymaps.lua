-- Keymaps

-- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- diagnostic map
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Different exit from terminal mode
-- Default is <C-\><C-n> (for ex. this does not work on MacOS with CH German layout)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- [[ Basic Autocommands ]] --> :help lua-guide-autocommands <--

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
})
-- I leave the following original version here as an example of how to create cmd groups
-- vim.api.nvim_create_autocmd('TextYankPost', {
--     desc = 'Highlight when yanking text',
--     group = vim.api.nvim_create_autocmd('kickstart-highlight-yank', { clear = true }),
--     callback = function()
--         vim.highlight.on_yank()
--     end,
-- })

-- vim: ts=2 sts=2 sw=2 et
