-- lua/lsp/cmp.lua
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- Usa LuaSnip para snippets
        end,
    },
    mapping = {
        ['<C-e>'] = cmp.mapping.close(), -- Cierra la ventana de autocompletado
        -- ['<C-d>'] = cmp.mapping.scroll_docs(-4), -- Tabula -4 cuando se usa el cmap
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Tabula 4 cuando se usa el cmap
        -- ['<C-Space>'] = cmp.mapping.complete(),  --
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Confirmar selección
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'render-markdown' },
    },
})
