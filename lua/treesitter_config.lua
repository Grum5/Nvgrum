
local languages = {
    'lua',
    'python',
    'cpp',
    'javascript',
    'typescript',
    'astro',
    'kotlin',
    'c_sharp',
}

require("nvim-treesitter.configs").setup({
    ensure_installed = languages,
    highlight = {
        enable = true, -- Activa resaltado de sintaxis avanzado
    },
    indent = {
        enable = true, -- Activa indentación automática
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            -- init_selection = "gnn", -- Iniciar selección incremental
            -- node_incremental = "grn", -- Expandir selección
            -- scope_incremental = "grc", -- Expandir al siguiente bloque lógico
            -- node_decremental = "grm", -- Reducir selección
        },
    },
})
