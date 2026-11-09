#!/usr/bin/env bash
# Instala esta config de Neovim en una maquina nueva: dependencias, Neovim fijo, vim-plug y plugins fijados.
# Uso:  ./install.sh          -> instala todo
#       ./install.sh --lock   -> regenera plugins.lock con los commits de los plugins instalados aqui
set -euo pipefail

NVIM_VERSION="v0.12.6"
TS_VERSION="0.27.2"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF_DIR="$HOME/.config/nvim"
PLUG_DIR="$HOME/.local/share/nvim/plugged"
LOCK="$REPO_DIR/plugins.lock"
SUDO=""; [[ $EUID -eq 0 ]] || SUDO=sudo  # en VPS como root no suele existir sudo

if [[ "${1:-}" == "--lock" ]]; then
    for d in "$PLUG_DIR"/*/; do
        echo "$(basename "$d") $(git -C "$d" rev-parse HEAD)"
    done > "$LOCK"
    echo "plugins.lock actualizado ($(wc -l < "$LOCK") plugins)"; exit 0
fi

# 1. Dependencias del sistema
# shortcut: solo apt (Debian/Ubuntu/Raspberry Pi OS); agregar dnf/pacman si se usa otra distro
$SUDO apt-get update
$SUDO apt-get install -y ca-certificates git curl tar gzip unzip make gcc xclip

case "$(uname -m)" in
    x86_64)        ARCH=x86_64; TS_ARCH=x64 ;;
    aarch64|arm64) ARCH=arm64;  TS_ARCH=arm64 ;;
    *) echo "Arquitectura no soportada: $(uname -m)"; exit 1 ;;
esac

# 2. tree-sitter-cli (nvim-treesitter rama main pide >= 0.26.1 y apt trae una version vieja)
if tree-sitter --version 2>/dev/null | grep -qx "tree-sitter $TS_VERSION"; then
    echo "tree-sitter $TS_VERSION ya instalado"
else
    curl -fL "https://github.com/tree-sitter/tree-sitter/releases/download/v$TS_VERSION/tree-sitter-linux-$TS_ARCH.gz" \
        | gunzip | $SUDO tee /usr/local/bin/tree-sitter > /dev/null
    $SUDO chmod +x /usr/local/bin/tree-sitter
fi

# 3. Neovim en la version exacta
if nvim --version 2>/dev/null | head -1 | grep -qx "NVIM $NVIM_VERSION"; then
    echo "Neovim $NVIM_VERSION ya instalado"
else
    TMP="$(mktemp -d)"
    curl -fL -o "$TMP/nvim.tar.gz" \
        "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-$ARCH.tar.gz"
    $SUDO rm -rf "/opt/nvim-$NVIM_VERSION"
    $SUDO mkdir -p "/opt/nvim-$NVIM_VERSION"
    $SUDO tar -xzf "$TMP/nvim.tar.gz" -C "/opt/nvim-$NVIM_VERSION" --strip-components=1
    $SUDO ln -sf "/opt/nvim-$NVIM_VERSION/bin/nvim" /usr/local/bin/nvim
    rm -rf "$TMP"
    hash -r
fi

# 4. Config en ~/.config/nvim (si el repo se clono/copio en otro lado, se enlaza)
if [[ "$REPO_DIR" != "$(readlink -f "$CONF_DIR" 2>/dev/null)" ]]; then
    if [[ -e "$CONF_DIR" ]]; then
        echo "ERROR: $CONF_DIR ya existe y no es este repo. Muevelo y vuelve a correr."; exit 1
    fi
    mkdir -p "$HOME/.config"
    ln -s "$REPO_DIR" "$CONF_DIR"
fi

# 5. vim-plug
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 6. Plugins (los errores de init.lua en esta primera corrida son normales: aun no hay plugins)
nvim --headless -c 'PlugInstall --sync' -c 'qa!' || true

# 7. Fijar cada plugin al commit de plugins.lock (vim-plug clona con --depth 1, por eso el fetch)
if [[ -f "$LOCK" ]]; then
    while read -r name commit; do
        d="$PLUG_DIR/$name"
        [[ -d "$d" ]] || { echo "AVISO: $name no esta instalado"; continue; }
        git -C "$d" fetch -q --depth 1 origin "$commit" && git -C "$d" checkout -q "$commit" \
            || echo "AVISO: no se pudo fijar $name a $commit"
    done < "$LOCK"
fi

# 8. Servidores LSP de la lista 'servers' y parsers de treesitter
# mason-lspconfig no instala en modo headless; MasonUpdate baja el registro y MasonInstall espera a terminar
nvim --headless -c 'MasonUpdate' -c "lua local map = require('mason-lspconfig.mappings').get_mason_map().lspconfig_to_package
    local pkgs = vim.tbl_map(function(s) return map[s] end, require('mason-lspconfig.settings').current.ensure_installed)
    vim.cmd('MasonInstall ' .. table.concat(pkgs, ' '))
    local ts_task = package.loaded.treesitter_config
    if type(ts_task) == 'table' then ts_task:wait(600000) end" -c 'qa!'

echo "Listo."
