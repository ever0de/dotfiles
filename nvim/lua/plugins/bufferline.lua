local bufferline = require('bufferline')

bufferline.setup {
	options = {
		mode = 'buffers',
		numbers = 'ordinal',
		diagnostics = 'nvim_lsp',
		offsets = {
			{
				filetype = 'NvimTree',
				text = 'File Explorer',
				separator = true,
			}
		},
	},
}

vim.keymap.set('n', '<Leader>1', function() bufferline.go_to_buffer(1, true) end)
vim.keymap.set('n', '<Leader>2', function() bufferline.go_to_buffer(2, true) end)
vim.keymap.set('n', '<Leader>3', function() bufferline.go_to_buffer(3, true) end)
vim.keymap.set('n', '<Leader>4', function() bufferline.go_to_buffer(4, true) end)
vim.keymap.set('n', '<Leader>5', function() bufferline.go_to_buffer(5, true) end)
vim.keymap.set('n', '<Leader>6', function() bufferline.go_to_buffer(6, true) end)
vim.keymap.set('n', '<Leader>7', function() bufferline.go_to_buffer(7, true) end)
vim.keymap.set('n', '<Leader>8', function() bufferline.go_to_buffer(8, true) end)
vim.keymap.set('n', '<Leader>9', function() bufferline.go_to_buffer(9, true) end)
vim.keymap.set('n', '<Leader>0', function() bufferline.go_to_buffer(10, true) end)
vim.keymap.set('n', '<Leader>w', '<cmd>bp|bd #<CR>')
vim.keymap.set('n', ']b', function() bufferline.cycle(1) end, { desc = 'Next [B]uffer' })
vim.keymap.set('n', '[b', function() bufferline.cycle( -1) end, { desc = 'Previous [B]uffer' })
