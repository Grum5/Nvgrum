-- Seleccionar el colorscheme
vim.cmd("colorscheme gruvbox")

-- Personalizar el cursor para que sea visible
-- vim.opt.guicursor = "n-v-c:ver25-Cursor/lCursor,i:ver35-Cursor/lCursor,r-cr:hor20"

-- Sobrescribir colores del cursor
-- vim.api.nvim_set_hl(0, "Cursor", { bg = "#ff0000", fg = "#ffffff" }) -- Rojo brillante
-- vim.api.nvim_set_hl(0, "lCursor", { bg = "#ff4500", fg = "#ffffff" }) -- Naranja

-- Habilitar resaltado de la linea actua
-- vim.opt.cursorline = true

-- Configurar el cursor como bloque parpadeante
vim.opt.guicursor = "n-v-c:block-Cursor-blinkon250,i:block-Cursor-blinkon250,r-cr:block-Cursor-blinkon250"

-- Personalizar los colores del cursor para simular semi-transparencia
vim.api.nvim_set_hl(0, "Cursor", { bg = "#ff5555", fg = "#000000" }) -- Fondo semi-transparente (visual) y texto negro
vim.api.nvim_set_hl(0, "lCursor", { bg = "#ff7777", fg = "#000000" }) -- Fondo más claro para local cursor

-- Habilitar resaltado de la línea actual
vim.opt.cursorline = true
