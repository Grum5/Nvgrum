require("bufferline").setup {
  options = {
    numbers = "none",               -- No mostrar números en los buffers
    close_command = nil,            -- Deshabilitar el comando de cierre con el mouse
    right_mouse_command = nil,      -- Deshabilitar el comando con el clic derecho
    left_mouse_command = "buffer %d",  -- Cambiar de buffer con el clic izquierdo (sin usar mouse)
    middle_mouse_command = nil,     -- Desactivar clic del medio
    indicator = {
      style = "icon",               -- Usar un icono como indicador del buffer activo
      icon = "▎",                   -- Indicador de buffer activo
    },
    buffer_close_icon = "",         -- Sin icono para cerrar el buffer
    modified_icon = "●",            -- Icono para buffers modificados
    close_icon = "",                -- Sin icono para el botón de cerrar
    left_trunc_marker = "",         -- No mostrar marcador de truncamiento a la izquierda
    right_trunc_marker = "",        -- No mostrar marcador de truncamiento a la derecha
    max_name_length = 18,           -- Longitud máxima del nombre de los archivos
    max_prefix_length = 15,         -- Longitud máxima del nombre truncado
    tab_size = 18,                  -- Tamaño de las pestañas
    diagnostics = "nvim_lsp",       -- Mostrar diagnósticos LSP
    diagnostics_update_in_insert = false, -- No actualizar diagnósticos en modo insert
    custom_filter = function(buf_number, buf_numbers)
      return true  -- Mostrar todos los buffers sin restricciones
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer", padding = 1}},  -- Ajustes para NvimTree si lo usas
    show_buffer_icons = true,       -- Mostrar iconos para los archivos
    show_buffer_close_icons = false, -- Deshabilitar los iconos de cerrar
    show_tab_indicators = false,    -- No mostrar indicadores de pestañas
    persist_buffer_sort = true,     -- Mantener el orden de los buffers
  },
}
