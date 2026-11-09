-- ---------------------------------------------------
-- Llamando las dependencias necesarias
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

-- Verificar que esten instalados los servidores
local servers = {
    -- 'clangd',                 -- No soportado en Raspberry Pi 5 Ubuntu server
    -- 'pylsp',                    -- Python LSP
    -- 'jinja_lsp',                -- Jinja LSP
    'lua_ls',                   -- Lua LSP
    -- 'ts_ls',                    -- Javascript and Typescript LSP
    -- 'astro',                  -- Astro LSP
    -- 'kotlin_language_server', -- Kotlin LSP
    -- 'gradle_ls',                 -- Gradle LSP
    -- 'omnisharp',              -- C# LSP
    -- 'vale_ls'                    -- Markdown & Text LSP
}

-- ---------------------------------------------------
-- Atajos que se activan cuando un servidor LSP se conecta al buffer
vim.api.nvim_create_autocmd("LspAttach", { callback = function(args)
    local bufnr = args.buf
    -- Helper para asignar atajos
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = { noremap = true, silent = true }

    -- Navegación y ayuda
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)        -- Ir a la definición
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)       -- Ir a la declaración
    buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)        -- Mostrar referencias
    buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)    -- Ir a implementación
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)              -- Mostrar documentación flotante
    buf_set_keymap("n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Ayuda de firma

    -- Diagnósticos
    buf_set_keymap("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)         -- Ir al diagnóstico previo
    buf_set_keymap("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)         -- Ir al siguiente diagnóstico
    buf_set_keymap("n", "<leader>e", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts) -- Mostrar diagnóstico actual
    buf_set_keymap("n", "<leader>q", "<Cmd>lua vim.diagnostic.setloclist()<CR>", opts) -- Añadir diagnósticos al local list

    -- Acciones de código
    buf_set_keymap("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)      -- Renombrar variable
    buf_set_keymap("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Ejecutar acción de código

    -- Formateo
    buf_set_keymap("n", "<leader>f", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts) -- Formatear el archivo actual
end })

-- ---------------------------------------------------
-- Mason setup
mason.setup()

-- ---------------------------------------------------
-- Configuración específica para el LSP de Lua (API de Neovim 0.11)
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        }
    }
})

-- ---------------------------------------------------
-- Mason-lspconfig v2: instala los servidores y los habilita con vim.lsp.enable
mason_lspconfig.setup({
    ensure_installed = servers,
})
