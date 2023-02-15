-- Theme
require('onedark').setup { style = 'warmer' }
require('onedark').load()

-- File Explorer Tree
require('nvim-tree').setup()
-- Status line
require('lualine').setup {
	options = {
		section_separators = '',
		component_separators = '|',
		disabled_filetypes = {
			statusline = { 'NvimTree', 'toggleterm' },
			winbar = { 'NvimTree', 'toggleterm' }
		},
	},
}
require("bufferline").setup()
require('trouble').setup {
	height = 15,
	mode = 'document_diagnostics',
}
require('lsp-colors').setup()

-- Terminal
require('toggleterm').setup {
	open_mapping = [[<Space>`]],
	direction = 'float',
	float_opts = {
		border = 'curved',
	},
}
