-- Example of plugin configured to run Lua code when loaded.
-- Events can be normal autocommand events
-- Using the `config` key, the configuration is run only after
-- the plugin is loaded.
--
return {
  { -- Useful plugin to show you pending keybinds.
	'folke/which-key.nvim',
	event = 'VimEnter',  -- sets loading event to VimEnter
	opts = {
	  icons = {
		-- set icon keymappings to true only if NerdFont installed
		mappings = vim.g.have_nerd_font,
		-- set keys to empty table if NerdFont otherwise string table
		keys = vim.g.have_nerd_font and {} or {
		  Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
		},
	  },

	  -- Document existing key chains
	  spec = {
		{ '<leader>c', group = '[C]ode',  mode = { 'n', 'x' } },
		{ '<leader>d', group = '[D]ocument' },
		{ '<leader>r', group = '[R]ename' },
		{ '<leader>s', group = '[S]earch' },
		{ '<leader>w', group = '[W]orkspace' },
		{ '<leader>t', group = '[T]oggle' },
		{ '<leader>h', group = 'Git [H]unk',  mode = { 'n', 'v' } },
	  },
	},
  },
}

-- vim: ts=2 sts=2 sw=2 et