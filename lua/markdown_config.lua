
require('render-markdown').setup({
    enabled = true,
    render_modes = { 'n', 'c', 't' },       -- Render en modo default
    injections = {                          -- Habilitar inyecciones de treesitter
        gitcommit = {
            enabled = true,
            query = [[
                ((message) @injection.content
                    (#set! injection.combined)
                    (#set! injection.include-children)
                    (#set! injection.language "markdown"))
            ]],
        },
    },
})

