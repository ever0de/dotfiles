-- Theme
require('onedark').setup { style = 'warmer' }
require('onedark').load()

-- Status line
require('lualine').setup {
	options = {
		section_separators = '',
		component_separators = '|',
		disabled_filetypes = {
			statusline = { 'NvimTree', 'toggleterm' },
		},
	},
}

require('trouble').setup {
	height = 15,
	mode = 'document_diagnostics',
}

-- Terminal
require('toggleterm').setup {
	open_mapping = '<Leader>`',
	direction = 'horizontal',
	float_opts = {
		border = 'curved',
	},
}

-- Git
require('gitsigns').setup()
require('foldsigns').setup()

require('lsp-colors').setup()
