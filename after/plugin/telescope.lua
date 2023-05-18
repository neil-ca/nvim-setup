local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
