# `~/.config` configuration files

## Neovim

### Packer Install

```vim
:PackerSync
```

### [Keymap](./nvim/lua/keymap.lua)

- `<Space> + e` : Open file explorer
- ``<Space> + ` ``: Open toggle terminal


## Troubleshooting

### (UNKNOWN PLUGIN): Error executing lua: attempt to call a {nil,number} value

I don't know why, but if you don't use gitsigns and foldsigns at the same time, you'll get an error when you open nvim-tree on a directory.
