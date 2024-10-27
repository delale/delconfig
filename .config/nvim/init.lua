-- Personal config @delale
-- This is based on kickstart.nvim and mainly used to learn how to config by doing
-- vim: ts=2 sts=2 sw=2 et

-- Set leader
vim.g.mapleader = ' '
vim.g.maplocaleader = ' '

-- Nerd Fonts
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Keymaps ]]
require 'keymaps'

-- [[ Installing Lazy plugin manager ]]
require 'lazy-bootstrap'

-- TODO: [ Plugins ]
require 'lazy-plugins'
