local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
	defaults = {
		winblend = 20,
		dynamic_preview_title = true,
	},
	pickers = {
		find_files = {
			theme = 'dropdown'
		},
		buffers = {
			theme = 'dropdown'
		},
		current_buffer_fuzzy_find = {
			theme = 'dropdown',
			previewer = false,
		},
	},
}

vim.keymap.set('n', '<Leader>p', builtin.find_files)
vim.keymap.set('n', '<Leader><S-f>', builtin.live_grep)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<Leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
