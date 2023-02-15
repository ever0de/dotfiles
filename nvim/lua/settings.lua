-- Line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.wrap = true

-- Undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wildignorecase = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Completion
vim.opt.completeopt = 'menu,menuone,noselect'

-- NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Color
vim.opt.termguicolors = true

vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 300
vim.wo.signcolumn = 'yes:2'

vim.opt.fileformat = 'unix'
vim.opt.encoding = 'utf-8'
vim.cmd([[
	language en_US
]])
