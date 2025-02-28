-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
-- Configurar el cursor como bloque parpadeante
vim.opt.guicursor = "n-v-c:block-Cursor-blinkon250,i:block-Cursor-blinkon250,r-cr:block-Cursor-blinkon250"

-- Personalizar los colores del cursor para simular semi-transparencia
vim.api.nvim_set_hl(0, "Cursor", { bg = "#ff5555", fg = "#000000" }) -- Fondo semi-transparente (visual) y texto negro
vim.api.nvim_set_hl(0, "lCursor", { bg = "#ff7777", fg = "#000000" }) -- Fondo más claro para local cursor

-- Habilitar resaltado de la línea actual
vim.opt.cursorline = true
