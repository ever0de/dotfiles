local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Automatically re-compile whenever plugins.lua is updated
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugin_setup.lua source <afile> | PackerSync
	augroup end
]])

local status, packer = pcall(require, 'packer')
if not status then
	return
end

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'lewis6991/impatient.nvim'

	-- UI
	use { -- File explorer tree
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}
	use { -- Theme inspired by Atom
		'navarasu/onedark.nvim'
	}
	use { -- Fancier statusline
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use { -- A snazzy 💅 buffer line (with tabpage integration) for Neovim
		'akinsho/bufferline.nvim',
		tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons'
	}
	use { -- easily manage multiple terminal windows
		'akinsho/toggleterm.nvim'
	}
	use { -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
