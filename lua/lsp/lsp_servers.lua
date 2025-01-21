-- lua/lsp/servers.lua
local lspconfig = require('lspconfig')

-- Función para configurar teclas específicas para LSP
local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    -- Atajos útiles
    keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

-- Configuración de Python
lspconfig.pylsp.setup({
    on_attach = on_attach,
})

-- Configuración de C++
lspconfig.clangd.setup({
    on_attach = on_attach,
})
