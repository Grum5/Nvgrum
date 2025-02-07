
require("bufferline").setup {
  options = {
    numbers = "none",               -- No mostrar números en los buffers
    buffer_close_icon = "",         -- Sin icono para cerrar el buffer
    modified_icon = "●",            -- Icono para buffers modificados
    close_icon = "",                -- Sin icono para el botón de cerrar
    left_trunc_marker = "",         -- No mostrar marcador de truncamiento a la izquierda
    right_trunc_marker = "",        -- No mostrar marcador de truncamiento a la derecha
    max_name_length = 18,           -- Longitud máxima del nombre de los archivos
    max_prefix_length = 15,         -- Longitud máxima del nombre truncado
    tab_size = 18,                  -- Tamaño de las pestañas
    highlights = {
        fill = {
            bg = {
                attribute = "fg",
                highlight = "Pmenu"
            }
        }
    },
    diagnostics = "nvim_lsp",       -- Mostrar diagnósticos LSP
    diagnostics_update_in_insert = false, -- No actualizar diagnósticos en modo insert
    custom_filter = function(buf_number, buf_numbers)
        local buf_name = vim.fn.bufname(buf_number)
        if vim.fn.isdirectory(buf_name) == 1 then
            return false
        end
        return true  -- Mostrar todos los buffers sin restricciones
    end,
    show_buffer_icons = true,       -- Mostrar iconos para los archivos
    show_buffer_close_icons = false, -- Deshabilitar los iconos de cerrar
    show_tab_indicators = false,    -- No mostrar indicadores de pestañas
    persist_buffer_sort = true,     -- Mantener el orden de los buffers
  },
}

