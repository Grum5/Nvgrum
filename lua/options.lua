-- ~/.config/nvim/lua/options.lua

-- Opciones generales
vim.opt.number = true         -- Mostrar números de línea
vim.opt.relativenumber = true -- Números relativos
vim.opt.expandtab = true      -- Usar espacios en vez de tabulaciones
vim.opt.shiftwidth = 4        -- Espacios por nivel de indentación
vim.opt.tabstop = 4           -- Tamaño de un tab
vim.opt.smartindent = true    -- Indentación inteligente
vim.opt.hlsearch = false      -- Desactivar el resaltado de búsqueda
vim.opt.incsearch = true      -- Búsqueda incremental
vim.opt.termguicolors = true  -- Colores en terminal
vim.opt.cmdheight = 2         -- Altura de la línea de comandos
vim.opt.laststatus = 2        -- Siempre mostrar la barra de estado.
vim.opt.ignorecase = true     -- Ignorar mayúsculas/minúsculas en búsquedas
vim.opt.smartcase = true      -- Activar búsqueda sensible a mayúsculas
vim.o.wrap = true

-- Otros ajustes específicos de Neovim
vim.opt.clipboard = "unnamedplus"  -- Usar el portapapeles del sistema

-- Configurar la apertura de ventanas verticales en el lado derecho
vim.opt.splitright = true
-- Configurar la apertura de ventanas horizontales en la parte inferior
vim.opt.splitbelow = true

-- Configuración básica para netrw en Lua
vim.g.netrw_liststyle = 3           -- Usa el modo de árbol

-- Deshabilitar el uso del raton
-- vim.opt.mouse = ""

-- Configurar el cursor como bloque parpadeante
vim.opt.guicursor = "n-v-c:block-Cursor-blinkon250,i:block-Cursor-blinkon250,r-cr:block-Cursor-blinkon250"

-- Personalizar los colores del cursor para simular semi-transparencia
vim.api.nvim_set_hl(0, "Cursor", { bg = "#ff5555", fg = "#000000" }) -- Fondo semi-transparente (visual) y texto negro
vim.api.nvim_set_hl(0, "lCursor", { bg = "#ff7777", fg = "#000000" }) -- Fondo más claro para local cursor

-- Habilitar resaltado de la línea actual
vim.opt.cursorline = true
