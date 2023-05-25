require('rose-pine').setup({
    disable_bacground = true
})
function ColorMyPencils(color)
	color = color or "rose-pine"

    --vim.g.everforest_background = 'hard'
    --vim.g.everforest_better_performance = 1
	vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
-- vim.cmd.colorscheme("everforest")
