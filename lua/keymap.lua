-- Habilitar tecla leader
vim.g.mapleader = " "

-- Deshabilitar teclas de flecha en modo normal
vim.api.nvim_set_keymap('n', '<Up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '', { noremap = true, silent = true })

-- Deshabilitar teclas de flecha en modo de inserción
vim.api.nvim_set_keymap('i', '<Up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '', { noremap = true, silent = true })

-- Deshabilitar teclas de flecha en modo visual
vim.api.nvim_set_keymap('v', '<Up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Down>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Right>', '', { noremap = true, silent = true })

-- Abrir el modo Explore
vim.api.nvim_set_keymap('n', '<Leader><Esc>', ':Explore<CR>', { noremap = true, silent = true })

-- Bufferline plugin hotkeys
vim.api.nvim_set_keymap('n', '<Leader><', ':BufferLineCycleNext<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true})

