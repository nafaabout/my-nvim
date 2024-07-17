-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.blamer_enabled = true
vim.g.blamer_delay = 1000
vim.g.blamer_show_in_insert_modes = 0
vim.g.blamer_prefix = " >>> "
vim.g.blamer_template = "<committer> / <committer-time>:  <summary>"

vim.g.rufo_auto_formatting = 1

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 10

vim.g.python3_host_prog = "/usr/bin/python3.10"
vim.g.background = "light"

-- Disable autoformating
vim.g.autoformat = false
