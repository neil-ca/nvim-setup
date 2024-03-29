local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("linuxbox.lazy")
require("linuxbox.remap")
require("linuxbox.set")
require("linuxbox.telescope")
require("linuxbox.zenmode")
require("linuxbox.lsp")
require("linuxbox.dap")
