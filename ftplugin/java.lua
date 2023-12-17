local home = os.getenv "HOME"
local config = {
    cmd = {
        home .. '/.local/share/nvim/mason/bin/jdtls',
        "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar"
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
