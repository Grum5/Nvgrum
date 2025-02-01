-- ---------------------------------------------------
-- Llamando las dependencias necesarias
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

-- Verificar que esten instalados los servidores
local servers = {
    'clangd',                   -- C++ LSP
    'pylsp',                    -- Python LSP
    'lua_ls',                   -- Lua LSP
    'ts_ls',                    -- Javascript and Typescript LSP
    'astro',                    -- Astro LSP
    'kotlin_language_server',   -- Kotlin LSP
    'gradle_ls',                -- Gradle LSP
    'omnisharp',                -- C# LSP
    -- 'grammarly',                -- Markdown / Text LSP
}

-- ---------------------------------------------------
-- Configuracion de la funcion para usar los hotkeys cuando se cargue un servidor LSP
local on_attach = function(client, bufnr)
    -- Helper para asignar atajos
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = { noremap = true, silent = true }

    -- Navegación y ayuda
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)       -- Ir a la definición
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)     -- Ir a la declaración
    -- buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)      -- Mostrar referencias
    -- buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- Ir a implementación
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)            -- Mostrar documentación flotante
    buf_set_keymap("n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Ayuda de firma

    -- Diagnósticos
    buf_set_keymap("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)    -- Ir al diagnóstico previo
    buf_set_keymap("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)    -- Ir al siguiente diagnóstico
    -- buf_set_keymap("n", "<leader>e", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts) -- Mostrar diagnóstico actual
    -- buf_set_keymap("n", "<leader>q", "<Cmd>lua vim.diagnostic.setloclist()<CR>", opts) -- Añadir diagnósticos al local list

    -- Acciones de código
    -- buf_set_keymap("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)      -- Renombrar variable
    -- buf_set_keymap("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Ejecutar acción de código

    -- Formateo
    -- buf_set_keymap("n", "<leader>f", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts) -- Formatear el archivo actual
end

-- ---------------------------------------------------
-- Mason setup
mason.setup()

-- ---------------------------------------------------
-- Mason-lspconfig setup
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

mason_lspconfig.setup_handlers({
    function(server_name) -- Configurar cada servidor con la función on_attach
        lspconfig[server_name].setup({
            on_attach = on_attach,
        })
    end,
})

-- ---------------------------------------------------
-- LSP servers setup

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

lspconfig.omnisharp.setup({})               -- omnisharp LSP setup | C#

-- lspconfig.grammarly.setup({})               -- grammarly LSP setup | Markdown & Text


