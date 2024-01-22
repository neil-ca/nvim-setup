vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>vv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>-", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>ñ", "<cmd>qa!<CR>")
vim.keymap.set("n", "<leader>.", "<cmd>w<CR>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- vim.keymap.set("n", "<leader>1", "1gt")
-- vim.keymap.set("n", "<leader>2", "2gt")
-- vim.keymap.set("n", "<leader>3", "3gt")
-- vim.keymap.set("n", "<leader>4", "4gt")
-- vim.keymap.set("n", "<leader>5", "5gt")

--vim.keymap.set("n", "<leader>ff", ":lua vim.lsp.buf.format()")

vim.keymap.set("n", "<leader>ff", ":Prettier")
vim.keymap.set("n", "<leader>fg", ":lua vim.lsp.buf.format()")

vim.keymap.set("n", "<leader>tt", "<cmd>split term://zsh<CR>")
vim.keymap.set("t", "<leader>q", [[<C-\><C-n>]])

-- vim.keymap.set("n", "<leader>r", "<cmd>!cargo run<CR>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader><leader>", "/")

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end)
