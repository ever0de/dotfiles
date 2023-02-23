vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup {
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
}
local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end

	-- open the tree
	require('nvim-tree.api').tree.open()
end
vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })


vim.keymap.set('n', '<Leader>e', '<Cmd>NvimTreeFindFileToggle<CR>')
