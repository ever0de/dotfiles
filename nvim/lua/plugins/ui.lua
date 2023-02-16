-- Theme
require('onedark').setup { style = 'warmer' }
require('onedark').load()

-- File Explorer Tree
require('nvim-tree').setup {
	open_on_setup = true,
	disable_netrw = true,
	hijack_unnamed_buffer_when_opening = true,
	sync_root_with_cwd = true,
	update_focused_file = { enable = true },
	diagnostics = { enable = true },
	modified = { enable = true },
	select_prompts = true,
	view = {
		width = 35,
		relativenumber = true,
	},
	renderer = {
		full_name = true,
		indent_markers = {
			enable = true,
		},
	},
	actions = {
		expand_all = {
			exclude = { '.git', 'target', 'node_modules' }
		},
	},
	tab = {
		sync = {
			open = true,
			close = true,
		},
	},
}
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
	open_mapping = '<Leader>`',
	direction = 'float',
	float_opts = {
		border = 'curved',
	},
}

-- Git
require('gitsigns').setup()
