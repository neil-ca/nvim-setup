require("dapui").setup()
require('dap-go').setup()
local dap = require("dap")
local rt = require("rust-tools")
local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

rt.setup({
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>kl", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    tools = {
        hover_actions = {
            auto_focus = true,
        },
    },
})

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = codelldb_path,
        args = { "--port", "${port}" },
    }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
dap.configurations.c = dap.configurations.cpp

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F9>', function() dap.step_back() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
vim.keymap.set('n', '<Leader>df', function() require("dapui").float_element('scopes', { enter = true }) end)
vim.keymap.set('n', '<leader>td', function() require('dap-go').debug_test() end)
vim.keymap.set('n', '<leader>tr', function() require('dapui').open() end)
vim.keymap.set('n', '<leader>te', function() require('dapui').close() end)
vim.keymap.set('n', '<leader>tc', "<cmd>Telescope dap commands<CR>")
