-- NvimTree
vim.keymap.set('n', '<Space>e', '<cmd>NvimTreeFindFileToggle<CR>')

-- Bufferline
local bufferline = require('bufferline')
vim.keymap.set('n', '<Space>1', function() bufferline.go_to_buffer(1, true) end)
vim.keymap.set('n', '<Space>2', function() bufferline.go_to_buffer(2, true) end)
vim.keymap.set('n', '<Space>3', function() bufferline.go_to_buffer(3, true) end)
vim.keymap.set('n', '<Space>4', function() bufferline.go_to_buffer(4, true) end)
vim.keymap.set('n', '<Space>5', function() bufferline.go_to_buffer(5, true) end)
vim.keymap.set('n', '<Space>6', function() bufferline.go_to_buffer(6, true) end)
vim.keymap.set('n', '<Space>7', function() bufferline.go_to_buffer(7, true) end)
vim.keymap.set('n', '<Space>8', function() bufferline.go_to_buffer(8, true) end)
vim.keymap.set('n', '<Space>9', function() bufferline.go_to_buffer(9, true) end)
vim.keymap.set('n', '<Space>0', function() bufferline.go_to_buffer(10, true) end)
vim.keymap.set('n', '<Space>q', '<cmd>bp|bd #<CR>')
vim.keymap.set('n', ']b', function() bufferline.cycle(1) end, { desc = 'Next [B]uffer' })
vim.keymap.set('n', '[b', function() bufferline.cycle( -1) end, { desc = 'Previous [B]uffer' })
