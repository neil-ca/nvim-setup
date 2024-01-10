vim.g.mapleader = " "

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>-", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>ñ", "<cmd>qa!<CR>")
vim.keymap.set("n", "<leader>.", "<cmd>w<CR>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")

--vim.keymap.set("n", "<leader>ff", ":lua vim.lsp.buf.format()")

vim.keymap.set("n", "<leader>ff", ":Prettier")
vim.keymap.set("n", "<leader>fg", ":lua vim.lsp.buf.format()")

vim.keymap.set("n", "<leader>tt", "<cmd>split term://zsh<CR>")
vim.keymap.set("t", "<leader>q", [[<C-\><C-n>]])

vim.keymap.set("n", "<leader>r", "<cmd>!cargo run<CR>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader><leader>", "/")

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>6", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>7", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>8", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>9", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>0", function() ui.nav_file(5) end)

-- lsp
local lsp = require('lsp-zero')
lsp.preset("recommended")
lsp.set_preferences({
    sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require("mason").setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'rust_analyzer',
        'lua_ls',
        'gopls',
        'denols',
        'tailwindcss'
    },
    handlers = {
        lsp.default_setup,
    },
})
lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
require('luasnip.loaders.from_vscode').lazy_load()
require 'luasnip'.filetype_extend("handlebars", { "html" })
cmp.setup({
    -- completion = {
    --     autocomplete = false
    -- },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        -- { name = 'cmp_tabnine' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})

