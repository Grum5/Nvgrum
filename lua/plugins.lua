local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Theme Gruvbox
Plug 'morhetz/gruvbox'

-- LSP Plugin
Plug 'neovim/nvim-lspconfig'

-- Nvim-cmp y fuentes
Plug 'hrsh7th/nvim-cmp'                  -- " Framework de autocompletado
Plug 'hrsh7th/cmp-nvim-lsp'              -- " Fuente de LSP para nvim-cmp
Plug 'hrsh7th/cmp-buffer'                -- " Fuente para palabras en el buffer
Plug 'hrsh7th/cmp-path'                  -- " Fuente para rutas de archivos
Plug 'hrsh7th/cmp-cmdline'               -- " Fuente para línea de comandos
Plug 'L3MON4D3/LuaSnip'                  -- " Motor de snippets
Plug 'saadparwaiz1/cmp_luasnip'          -- " Integración de LuaSnip con nvim-cmp


vim.call('plug#end')


