-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<Leader>tb", ":TagbarOpen fj<cr>", { desc = "Open Tagbar and jump into it", silent = true })
map("n", "<Leader>tbc", ":TagbarClose<cr>", { desc = "Close Tagbar", silent = true })
map("n", "<Leader>rr", ":R<cr>", { desc = "Show Relative file with rails-vim :R", silent = true })
map("n", "<Leader>aa", ":A<cr>", { desc = "Show Alternative file with rails-vim :R", silent = true })

-- Git - fugitive
map("n", "<Leader>ga", ":Git add %<cr>", { desc = "Stage current file", silent = true, remap = false })
map("n", "<Leader>gs", ":Git<cr>", { desc = "Show fugitive git status", silent = true, remap = false })
map("n", "<Leader>gl", ":Gllog<cr>", { desc = "Show fugitive git log", silent = true, remap = false })
map("n", "]h", ":GitGutterNextHunk<cr>", { desc = "Go to next hunk", silent = true, remap = true })
map("n", "[h", ":GitGutterPrevHunk<cr>", { desc = "Go to previous hunk", silent = true, remap = true })

-- Highlight
map("n", "<Leader>hh", ":noh<cr>", { desc = "Clear Search Highlight", silent = true })

-- NvimTree
map("n", "<Leader>fe", ":NvimTreeFindFile<cr>", { desc = "Find File in NvimTree", silent = true })
map("n", "<Leader>fo", ":NvimTreeOpen<cr>", { desc = "Open NvimTree", silent = true })

-- vim.g.copilot_no_tab_map = true
--
local ls = require("luasnip")
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

map('i', '<Tab>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false, remap = false })
