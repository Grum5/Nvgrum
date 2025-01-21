-- ~/.config/nvim/lua/options.lua

-- Opciones generales
vim.opt.number = true             -- Mostrar números de línea
vim.opt.relativenumber = true     -- Números relativos
vim.opt.expandtab = true          -- Usar espacios en vez de tabulaciones
vim.opt.shiftwidth = 4            -- Espacios por nivel de indentación
vim.opt.tabstop = 4               -- Tamaño de un tab
vim.opt.smartindent = true        -- Indentación inteligente
vim.opt.hlsearch = false          -- Desactivar el resaltado de búsqueda
vim.opt.incsearch = true          -- Búsqueda incremental
vim.opt.termguicolors = true      -- Colores en terminal
vim.opt.cmdheight = 2             -- Altura de la línea de comandos
vim.opt.laststatus = 2            -- Siempre mostrar la barra de estado.
vim.opt.ignorecase = true         -- Ignorar mayúsculas/minúsculas en búsquedas
vim.opt.smartcase = true          -- Activar búsqueda sensible a mayúsculas

-- Sobrescribir colores del cursor
vim.api.nvim_set_hl(0, "Cursor", { bg = "#ff0000", fg = "#ffffff" }) -- Rojo brillante
vim.api.nvim_set_hl(0, "lCursor", { bg = "#ff4500", fg = "#ffffff" }) -- Naranja

-- Habilitar resaltado de la línea actual
vim.opt.cursorline = true
-- Otros ajustes específicos de Neovim
vim.opt.clipboard = "unnamedplus"  -- Usar el portapapeles del sistema

-- Configurar la apertura de ventanas verticales en el lado derecho
vim.opt.splitright = true
-- Configurar la apertura de ventanas horizontales en la parte inferior
vim.opt.splitbelow = true
