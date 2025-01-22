local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

-- Verificar que esten instalados los servidores
local servers = {
    'clangd',   -- C++ server
    'pylsp',    -- Python server
    'lua_ls',   -- Lua server
    'ts_ls',    -- Javascript and Typescript server
    'astro'     -- Astro Framework server
}

-- Mason setup
mason.setup()
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})
