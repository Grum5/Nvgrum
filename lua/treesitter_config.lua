-- /home/grum/.config/nvim/lua/treesitter_config.lua

-- En lugar de llamar require('nvim-treesitter.configs')
-- Usamos pcall para evitar que la configuración truene si aún no se ha instalado con vim-plug
local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter_configs.setup({
    -- Lista de parsers que deseas asegurar instalados
    ensure_installed = { 
        "c", 
        "lua", 
        "vim", 
        "vimdoc", 
        "query", 
        "python", 
        "bash", 
        "json", 
        "markdown" 
    },

    -- Instalación sincrónica de parsers
    sync_install = false,

    -- Auto-instalación de parsers faltantes al abrir un archivo
    auto_install = true,

    highlight = {
        enable = true, -- Activa el resaltado basado en Treesitter
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true, -- Activa la sangría automática basada en Treesitter
    },
})

