-- Seleccionar el colorscheme
vim.cmd("colorscheme gruvbox")

-- Personalizar el cursor para que sea visible
vim.opt.guicursor = "n-v-c:ver25-Cursor/lCursor,i:ver35-Cursor/lCursor,r-cr:hor20"

-- Sobrescribir colores del cursor
vim.api.nvim_set_hl(0, "Cursor", { bg = "#ff0000", fg = "#ffffff" }) -- Rojo brillante
vim.api.nvim_set_hl(0, "lCursor", { bg = "#ff4500", fg = "#ffffff" }) -- Naranja

-- Habilitar resaltado de la l√≠nea actual
vim.opt.cursorline = true
