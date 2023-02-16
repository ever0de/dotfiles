-- NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.wo.signcolumn = 'yes:2'
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
