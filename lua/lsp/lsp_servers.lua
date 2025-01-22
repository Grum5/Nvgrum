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

lspconfig.pylsp.setup({})   -- pylsp server setup Python

lspconfig.clangd.setup({})  -- clangd server setup C++

lspconfig.ts_ls.setup({})   -- ts_ls server setup Typescript and Javascript

lspconfig.astro.setup({})
