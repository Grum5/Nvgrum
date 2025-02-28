-- init.lua en la carpeta 'estetica'
local selected_theme = require("estetica.selected_theme")

-- Tabla con los temas disponibles y sus rutas correspondientes
local themes = {
    kanagawa = "estetica.themes.kanagawa",
    gruvbox = "estetica.themes.gruvbox",
}

-- Verificar si el tema seleccionado está en la tabla de themes
local theme_to_load = themes[selected_theme.theme]

if theme_to_load then
    require(theme_to_load)  -- Carga la configuración del tema
    vim.cmd("colorscheme " .. selected_theme.theme)  -- Cambia el colorscheme
else
    print("Tema no soportado: " .. selected_theme.theme)
end


-- estetica/lualine
require('estetica.lualine')

-- estetica bufferline
require('estetica.winbar')

