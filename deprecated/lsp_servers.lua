local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({    -- lua_ls server setup Lua
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}
            },
        },
    },
})

lspconfig.pylsp.setup({})                   -- pylsp LSP setup | Python

lspconfig.clangd.setup({})                  -- clangd LSP setup | C++

lspconfig.ts_ls.setup({})                   -- ts_ls LSP setup | Typescript and Javascript

lspconfig.astro.setup({})                   -- astro LSP setup | Astro Framework

lspconfig.kotlin_language_server.setup({})  -- kotlin_language_server LSP setup | Kotlin

lspconfig.gradle_ls.setup({})               -- gradle_ls LSP setup | Gradle

