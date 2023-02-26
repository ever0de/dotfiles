-- KeyMap
vim.g.mapleader = " "
vim.cmd([[
	language en_US
]])

local default_options = {
	-- clipboard = "unnamedplus", -- allows neovim to access the system clipboard

	-- Line number
	number = true,
	relativenumber = true,
	-- Ident
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	smartindent = true,
	breakindent = true,
	wrap = true,
	-- Undo history
	swapfile = false,
	backup = false,
	undofile = true,
	-- Search
	hlsearch = false,
	incsearch = true,
	wildignorecase = true,
	ignorecase = true,
	smartcase = true,
	-- Completion
	completeopt = 'menu,menuone,noselect',
	-- Color
	termguicolors = true,
	--
	cursorline = true,
	hidden = true,
	scrolloff = 8,
	updatetime = 300,
	--
	fileformat = 'unix',
	encoding = 'utf-8',
}

for k, v in pairs(default_options) do
	vim.opt[k] = v
end


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require('lazy').setup({
	{ -- Improve startup time	
		'lewis6991/impatient.nvim',
		config = function()
			require('impatient')
		end,
	},
	{ -- Theme inspired by Atom
		'navarasu/onedark.nvim',
		config = function()
			local theme = require('onedark')
			theme.setup { style = 'warmer' }
			theme.load()
		end
	},
	{ -- Nvim Treesitter configurations and abstraction layer
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = {
					'rust',
					'javascript',
					'typescript',
					'lua',
					'vim',
					'help'
				},
				highlight = { enable = true },
				indent = { enable = true },
			}
		end
	},
	{ -- Find, Filter, Preview, Pick. All lua, all the time
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = true,
        lazy = true,
        keys = {
            { '<Leader>p', require('telescope.builtin').find_files },
            { '<Leader><S-f>', require('telescope.builtin').live_grep },
            { '<Leader>fh', require('telescope.builtin').help_tags },
            { 
                '<Leader>/', 
                require('telescope.builtin').current_buffer_fuzzy_find,
			    desc = '[/] Fuzzily search in current buffer'
			},
        },
		opts = {
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
		},
	},
	{ -- File explorer tree
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = true,
		opts = {
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
					exclude = { '.git', 'target', 'build', 'dist', 'node_modules' }
				},
			},
			tab = {
				sync = {
					open = true,
					close = true,
				},
			},
			filters = {
				custom = { '^\\.git', 'target', 'build', 'dist', 'node_modules' }
			}
		},
		init = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			vim.api.nvim_create_autocmd({ 'VimEnter' }, {
				callback = function(data)
					local directory = vim.fn.isdirectory(data.file) == 1
					if directory then
						vim.cmd.cd(data.file)
					end
					require('nvim-tree.api').tree.open()
				end
			})
			vim.keymap.set('n', '<Leader>e', '<Cmd>NvimTreeFindFileToggle<CR>')
		end,
	},
	{ -- A snazzy 💅 buffer line (with tabpage integration) for Neovim
		'akinsho/bufferline.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = true,
		opts = {
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
		},
		init = function()
			vim.opt.termguicolors = true

			local bufferline = require('bufferline')
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
		end,
	},
	{ -- Git integration for buffers
		'lewis6991/gitsigns.nvim',
		config = true,
		lazy = true,
		-- NOTE: If nvim is opened with a directory, an error occurs when loading, such as with the API in `nvim-tree`: `(UNKNOWN PLUGIN): Error executing lua: attempt to call a {nil,number} value`.`
		event = 'VeryLazy',
	},
	{ -- Fancier statusline
		'nvim-lualine/lualine.nvim',
		config = true,
		opts = {
			options = {
				section_separators = '',
				component_separators = '|',
				disabled_filetypes = {
					-- TODO: Add toggleterm
					statusline = { 'Lazy', 'NvimTree', 'toggleterm' }
				},
			},
		},
	},
	{ -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
		opts = {
			height = 15,
			mode = 'document_diagnostics'
		},
	},
	{ -- A neovim lua plugin to help easily manage multiple terminal windows
		'akinsho/toggleterm.nvim',
		config = true,
		opts = {
			open_mapping = '<Leader>`',
			direction = 'horizontal',
			float_opts = {
				border = 'curved',
			},
		}
	}
})
