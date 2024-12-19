-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and not vim.g.vscode then
    opts.remap = nil
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Tagbar
map("n", "<Space>tb", ":TagbarOpen fj<cr>", { desc = "Open Tagbar and jump into it" })
map("n", "<Space>tbc", ":TagbarClose<cr>", { desc = "Close Tagbar" })

-- Rails.vim
map("n", "<Space>rr", ":R<cr>", { desc = "Show Relative file with rails-vim :R" })
map("n", "<Space>aa", ":A<cr>", { desc = "Show Alternative file with rails-vim :R" })

-- Git - fugitive and GitGutter
map("n", "<Space>ga", ":Git add %<cr>", { desc = "Stage current file" })
map("n", "<Space>gs", ":Git<cr>", { desc = "Show fugitive git status" })
map("n", "<Space>gl", ":Gllog<cr>", { desc = "Show fugitive git log" })
map("n", "<Space>sgs", ":Telescope git_status<CR>", { desc = "Telescope git status" })
map("n", "]h", ":GitGutterNextHunk<cr>", { desc = "Go to next hunk", remap = true })
map("n", "[h", ":GitGutterPrevHunk<cr>", { desc = "Go to previous hunk", remap = true })

-- Telescope
map("n", "<Space>fi", ":lua require('telescope.builtin').find_files({no_ignore = true})<CR>", { desc = "Find files (including ignored)" })

-- Inlay Hints
map("n", "<Space>ih", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", { desc = "Toggle inlay hints" })

-- Highlight
map("n", "<Space>hh", ":noh<cr>", { desc = "Clear Search Highlight" })

-- Copy current buffer path
map("n", "<Space>cp", ":let @+=expand('%:p')<CR>", { desc = "Copy current buffer path" })

-- NvimTree
-- map("n", "<Space>fe", ":NvimTreeFindFile<cr>", { desc = "Find File in NvimTree" })
-- map("n", "<Space>fo", ":NvimTreeOpen<cr>", { desc = "Open NvimTree" })

-- LuaSnip
local ls = require("luasnip")
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {silent = true})

-- Search word under cursor
vim.keymap.set('n', '<Space>*', function()
    local word = vim.fn.expand('<cWORD>')
    local escaped_word = vim.fn.fnameescape(word)
    vim.cmd('execute "' .. escaped_word .. '"')
end, { desc = "Search word under cursor" })

-- Find files by extension or full path
local function find_files_by(type, prompt)
  return function()
    local input = vim.fn.input(prompt .. ': ')
    if input ~= "" then
      require('telescope.builtin').find_files({
        prompt_title = "< Find Files by " .. prompt .. " >",
        find_command = {'fd', '--type', 'f', '--' .. type, input}
      })
    end
  end
end

map("n", "<Space>fx", find_files_by("extension", "Extension"), { desc = "Find files by extension" })
map("n", "<Space>fp", find_files_by("full-path", "Full Path"), { desc = "Find files by full path" })

-- Go To Definition
map("n", "<Space>gd", ":Telescope lsp_definitions<CR>", { desc = "Go To Definition" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
-- typescript-tools
map("n", "<Space>to", ":TSToolsOrganizeImports<CR>", { desc = "Organize Imports" })
map("n", "<Space>ts", ":TSToolsSortImports<CR>", { desc = "Sort Imports" })
map("n", "<Space>tru", ":TSToolsRemoveUnusedImports<CR>", { desc = "Remove Unused Imports" })
map("n", "<Space>tu", ":TSToolsRemoveUnused<CR>", { desc = "Remove All Unused" })
map("n", "<Space>ta", ":TSToolsAddMissingImports<CR>", { desc = "Add Missing Imports" })
map("n", "<Space>tf", ":TSToolsFixAll<CR>", { desc = "Fix All" })
map("n", "<Space>tg", ":TSToolsGoToSourceDefinition<CR>", { desc = "Go To Source Definition" })
map("n", "<Space>tr", ":TSToolsRenameFile<CR>", { desc = "Rename File" })
map("n", "<Space>tfr", ":TSToolsFileReferences<CR>", { desc = "Find File References" })


-- Eslint keymaps
map("n", "<Space>f", "mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F", { desc = "Autofix entire buffer with eslint_d" })
map("v", "<Space>f", ":!eslint_d --stdin --fix-to-stdout<CR>gv", { desc = "Autofix visual selection with eslint_d" })

