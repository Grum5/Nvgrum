local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

-- Verificar que esten instalados los servidores
local servers = {
    'clangd',                   -- C++ LSP
    'pylsp',                    -- Python LSP
    'lua_ls',                   -- Lua LSP
    'ts_ls',                    -- Javascript and Typescript LSP
    'astro',                    -- Astro LSP
    'kotlin_language_server',   -- Kotlin LSP
    'gradle_ls'                 -- Gradle LSP
}

-- Mason setup
mason.setup()
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})
