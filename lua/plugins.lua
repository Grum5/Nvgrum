local vim = vim

-- Si se copió la config sin correr install.sh, descarga vim-plug para no tronar con "Unknown function: plug#begin"
local plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.filereadable(plug_path) == 0 then
    vim.fn.system({ 'curl', '-fLo', plug_path, '--create-dirs',
        'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' })
    vim.cmd.source(plug_path)  -- recién descargado no lo ve el autoload en este arranque
end

local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Theme Gruvbox
Plug 'morhetz/gruvbox'

-- Theme KANAGAWA
Plug 'rebelot/kanagawa.nvim'

-- Mason Plugin, para el manejo de los servidores lsp
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

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

-- Nvim status line Lualine
Plug 'nvim-lualine/lualine.nvim'

-- Nvim bufferline
Plug 'akinsho/bufferline.nvim'

-- Nvim web devicons
Plug 'nvim-tree/nvim-web-devicons'
Plug 'kyazdani42/nvim-web-devicons'

-- Nvim Treesiter plugin
vim.cmd[[
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
]]

-- Markdown plugin
vim.cmd[[
Plug 'MeanderingProgrammer/render-markdown.nvim', {'do': 'make'}
]]

-- Autocomplete parentheses plugin
Plug 'tmsvg/pear-tree'

vim.call('plug#end')


-- Instala los plugins que falten antes de que init.lua cargue su configuración
local missing = vim.tbl_filter(function(p) return vim.fn.isdirectory(p.dir) == 0 end, vim.tbl_values(vim.g.plugs))
if #missing > 0 then
    vim.cmd('PlugInstall --sync | close')
end
