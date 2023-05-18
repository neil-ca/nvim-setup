local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.rustfmt,
    },
})
