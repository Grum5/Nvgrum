-- /home/grum/.config/nvim/lua/treesitter_config.lua
-- nvim-treesitter rama main (Neovim 0.12+): necesita tree-sitter-cli y un compilador de C

-- pcall para que la configuración no truene si aún no se ha instalado con vim-plug
local status_ok, ts = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

-- Parsers que deseas asegurar instalados (se instalan en segundo plano)
ts.install({
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "python",
    "bash",
    "json",
    "markdown",
    "markdown_inline",
})

-- Activa resaltado y sangría con Treesitter en el buffer
local function start(buf)
    if pcall(vim.treesitter.start, buf) then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
end

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if vim.list_contains(ts.get_installed(), lang) then
            start(args.buf)
        elseif vim.list_contains(ts.get_available(), lang) then
            -- Auto-instalación de parsers faltantes al abrir un archivo
            ts.install(lang):await(vim.schedule_wrap(function()
                if vim.api.nvim_buf_is_valid(args.buf) then start(args.buf) end
            end))
        end
    end,
})
