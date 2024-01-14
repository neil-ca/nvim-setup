require("lazy").setup({
    {'mfussenegger/nvim-dap', dependencies = 'rcarriga/nvim-dap-ui'},
    'leoluz/nvim-dap-go',
    'simrat39/rust-tools.nvim',
    'nvim-telescope/telescope-dap.nvim',
    'mfussenegger/nvim-jdtls',
    'ellisonleao/gruvbox.nvim',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'rose-pine/neovim',                name = 'rose-pine' },
    "savq/melange-nvim",
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'theprimeagen/harpoon',
    -- 'mbbill/undotree'
    'tpope/vim-fugitive',
    'terrortylor/nvim-comment',
    'jose-elias-alvarez/null-ls.nvim',
    -- use('jiangmiao/auto-pairs')
    'windwp/nvim-autopairs',
    'MunifTanjim/prettier.nvim',
    'sainnhe/everforest',
    "lukas-reineke/indent-blankline.nvim",
    -- use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    -- use { 'junegunn/fzf', run = "fzf#install()" }
    -- use {
    --     'nvim-lualine/lualine.nvim',
    --     requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    -- }
    'projekt0n/github-nvim-theme',
    {
        "folke/zen-mode.nvim",
        opts = {

        }
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x'
    },
    {
        'neovim/nvim-lspconfig', -- Required
        -- Optional
        'williamboman/mason.nvim',
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    'williamboman/mason-lspconfig.nvim',
    'mason-org/mason-registry',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'L3MON4D3/LuaSnip',
    "rafamadriz/friendly-snippets",

})
