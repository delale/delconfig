-- Telescope

return {
  { -- Fuzzy Finder (files, lsp, etc.)
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	branch = '0.1.x',
	dependencies = {
	  'nvim-lua/plenary.nvim',
	  {
		'nvim-telescope/telescope-fzf-native.nvim',
		-- `build` is used to run some command when the plugin is installed/updated
		build = 'make',

		-- `cond` is a condition used to determine whether the plugin should be installed and loaded
		cond = function()
		  return vim.fn.executable 'make' == 1
		end,
	  },
	  { 'nvim-telescope/telescope-ui-select.nvim' },
	  -- pretty icons
	  { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},
	config = function()
	  -- [[ Important Keymaps ]]
	  -- - Insert mode: <c-/>
	  -- - Normal mode: ?
	  -- Open window to show all keymaps for the current Telescope picker
	  
	  -- [[ Config ]]
	  require('telescope').setup {
		-- mappings
		-- defaults = {
		--   mappings = {
		-- 	i = { ['<c-enter>'] = 'to_fuzzy_refine'}
		--   },
		-- },
		-- pickers = {}
		extensions = {
		  ['ui-select'] = {
			require('telescope.themes').get_dropdown(),
		  },
		},
	  }

	  -- Enable Telescope extensions if they are installed
	  pcall(require('telescope').load_extension, 'fzf')
	  pcall(require('telescope').load_extension, 'ui-select')

	  -- see `:help telescope.builtin`
	  local builtin = require 'telescope.builtin'
	  vim.keymap.set('n', '<leaeder>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
	  vim.keymap.set('n', '<leaeder>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
	  vim.keymap.set('n', '<leaeder>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
	  vim.keymap.set('n', '<leaeder>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
	  vim.keymap.set('n', '<leaeder>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
	  vim.keymap.set('n', '<leaeder>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
	  vim.keymap.set('n', '<leaeder>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
	  vim.keymap.set('n', '<leaeder>sr', builtin.resume, { desc = '[S]earch [R]esume' })
	  vim.keymap.set('n', '<leaeder>s.', builtin.oldfiles, { desc = '[S]earch recent files' })
	  vim.keymap.set('n', '<leaeder><leader>.', builtin.buffers, { desc = '[ ] Find existing buffers' })

	  -- overriding default behaviour and theme
	  vim.keymap.set('n', '<leader>/', function()
		builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		  winblend = 10,
		  previewer = false,
		})
	  end, { desc = '[/] Fuzzily search in current buffer' })

	  -- Passing additional configuration options
	  -- see `:help telescope.builtin.live_grep()`
	  vim.keymap.set('n', '<leader>s/', function()
		builtin.live_grep {
		  grep_open_files = true,
		  prompt_title = 'Live Grep in Open Files',
		}
	  end, { desc = '[S]earch [/] in Open Files' })

	  -- shortcut for searching neovim configs
	  vim.keymap.set('n', '<leader>sn', function()
		builtin.find_files { cwd = vim.fn.stdpath 'config' }
	  end, { desc = '[S]earch [N]eovim files' })
	end,
  },
}

-- vim: ts=2 sts=2 sw=2 et