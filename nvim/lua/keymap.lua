-- NvimTree
vim.keymap.set('n', '<Space>e', '<cmd>NvimTreeFindFileToggle<CR>')

-- Bufferline
local bufferline = require('bufferline')
for i = 1, 10, 1 do
	vim.keymap.set('n', '<Space>' .. i, function() bufferline.go_to_buffer(i, true) end)
end
vim.keymap.set('n', '<Space>q', '<cmd>bp|bd #<CR>')
vim.keymap.set('n', ']b', function() bufferline.cycle(1) end, { desc = 'Next [B]uffer' })
vim.keymap.set('n', '[b', function() bufferline.cycle( -1) end, { desc = 'Previous [B]uffer' })
