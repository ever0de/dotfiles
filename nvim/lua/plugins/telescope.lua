local telescope = require('telescope')

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
