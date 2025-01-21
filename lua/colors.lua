--[[ 

Default options:
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

]]--

vim.cmd("colorscheme gruvbox")


-- Personalizar el cursor para que sea visible
vim.opt.guicursor = "n-v-c:ver25-Cursor/lCursor,i:ver35-Cursor/lCursor,r-cr:hor20"

-- Sobrescribir colores del cursor
vim.api.nvim_set_hl(0, "Cursor", { bg = "#ff0000", fg = "#ffffff" }) -- Rojo brillante
vim.api.nvim_set_hl(0, "lCursor", { bg = "#ff4500", fg = "#ffffff" }) -- Naranja

-- Habilitar resaltado de la línea actual
vim.opt.cursorline = true
