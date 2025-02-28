
local languages = {
    'lua',
    'python',
    'css',
    'cpp',
    'javascript',
    'typescript',
    'astro',
    'kotlin',
    'c_sharp',
    'markdown',
    'markdown_inline',
    'html',
    'java',
    'groovy',
    'jinja',
    'jinja_inline',
    'sql',
}

require('nvim-treesitter.configs').setup {
    modules = {},
    ensure_installed = languages,
    sync_install = false, -- Instala parsers de forma asíncrona
    auto_install = false, -- Auto-instala parsers faltantes
    ignore_install = {}, -- 🔧 Evita errores por requerimientos faltantes
    highlight = {
        enable = true, -- Activa resaltado de sintaxis avanzado
        additional_vim_regex_highlighting = false, -- Usa solo Treesitter para el resaltado
    },
    indent = {
        enable = true, -- Activa indentación automática
    },
    incremental_selection = {
        enable = true, -- Permite selección incremental de bloques de código
        keymaps = {
            init_selection = "gnn", -- Iniciar selección en el nodo actual
            node_incremental = "grn", -- Expandir selección al siguiente nodo
            scope_incremental = "grc", -- Expandir selección al siguiente bloque lógico
            node_decremental = "grm", -- Reducir selección
        },
    },
    --[[
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Activa selección anticipada (para elegir mejor los objetos)
            keymaps = {
                ["af"] = "@function.outer", -- Selecciona una función completa (afuera)
                ["if"] = "@function.inner", -- Selecciona el interior de una función
                ["ac"] = "@class.outer", -- Selecciona una clase completa
                ["ic"] = "@class.inner", -- Selecciona el interior de una clase
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- Guarda el salto en el registro para regresar después
            goto_next_start = {
                ["]f"] = "@function.outer", -- Siguiente inicio de función
                ["]c"] = "@class.outer", -- Siguiente inicio de clase
            },
            goto_next_end = {
                ["]F"] = "@function.outer", -- Siguiente final de función
                ["]C"] = "@class.outer", -- Siguiente final de clase
            },
            goto_previous_start = {
                ["[f"] = "@function.outer", -- Anterior inicio de función
                ["[c"] = "@class.outer", -- Anterior inicio de clase
            },
            goto_previous_end = {
                ["[F"] = "@function.outer", -- Anterior final de función
                ["[C"] = "@class.outer", -- Anterior final de clase
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner", -- Intercambia con el siguiente parámetro
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner", -- Intercambia con el parámetro anterior
            },
        },
    },
    ]]--
}
