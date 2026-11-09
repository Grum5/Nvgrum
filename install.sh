#!/usr/bin/env bash
# Instala esta config de Neovim en una maquina nueva: dependencias, Neovim fijo, vim-plug y plugins fijados.
# Uso:  ./install.sh          -> instala todo
#       ./install.sh --lock   -> regenera plugins.lock con los commits de los plugins instalados aqui
set -euo pipefail

NVIM_VERSION="v0.11.6"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF_DIR="$HOME/.config/nvim"
PLUG_DIR="$HOME/.local/share/nvim/plugged"
LOCK="$REPO_DIR/plugins.lock"

if [[ "${1:-}" == "--lock" ]]; then
    for d in "$PLUG_DIR"/*/; do
        echo "$(basename "$d") $(git -C "$d" rev-parse HEAD)"
    done > "$LOCK"
    echo "plugins.lock actualizado ($(wc -l < "$LOCK") plugins)"; exit 0
fi

# 1. Dependencias del sistema
# shortcut: solo apt (Debian/Ubuntu/Raspberry Pi OS); agregar dnf/pacman si se usa otra distro
sudo apt-get update
sudo apt-get install -y git curl tar gzip unzip make gcc xclip

# 2. Neovim en la version exacta
if nvim --version 2>/dev/null | head -1 | grep -qx "NVIM $NVIM_VERSION"; then
    echo "Neovim $NVIM_VERSION ya instalado"
else
    case "$(uname -m)" in
        x86_64)        ARCH=x86_64 ;;
        aarch64|arm64) ARCH=arm64 ;;
        *) echo "Arquitectura no soportada: $(uname -m)"; exit 1 ;;
    esac
    TMP="$(mktemp -d)"
    curl -fL -o "$TMP/nvim.tar.gz" \
        "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-$ARCH.tar.gz"
    sudo rm -rf "/opt/nvim-$NVIM_VERSION"
    sudo mkdir -p "/opt/nvim-$NVIM_VERSION"
    sudo tar -xzf "$TMP/nvim.tar.gz" -C "/opt/nvim-$NVIM_VERSION" --strip-components=1
    sudo ln -sf "/opt/nvim-$NVIM_VERSION/bin/nvim" /usr/local/bin/nvim
    rm -rf "$TMP"
    hash -r
fi

# 3. Config en ~/.config/nvim (si el repo se clono/copio en otro lado, se enlaza)
if [[ "$REPO_DIR" != "$(readlink -f "$CONF_DIR" 2>/dev/null)" ]]; then
    if [[ -e "$CONF_DIR" ]]; then
        echo "ERROR: $CONF_DIR ya existe y no es este repo. Muevelo y vuelve a correr."; exit 1
    fi
    mkdir -p "$HOME/.config"
    ln -s "$REPO_DIR" "$CONF_DIR"
fi

# 4. vim-plug
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 5. Plugins (los errores de init.lua en esta primera corrida son normales: aun no hay plugins)
nvim --headless -c 'PlugInstall --sync' -c 'qa!' || true

# 6. Fijar cada plugin al commit de plugins.lock (vim-plug clona con --depth 1, por eso el fetch)
if [[ -f "$LOCK" ]]; then
    while read -r name commit; do
        d="$PLUG_DIR/$name"
        [[ -d "$d" ]] || { echo "AVISO: $name no esta instalado"; continue; }
        git -C "$d" fetch -q --depth 1 origin "$commit" && git -C "$d" checkout -q "$commit" \
            || echo "AVISO: no se pudo fijar $name a $commit"
    done < "$LOCK"
fi

echo "Listo. Al abrir nvim por primera vez, Mason instalara los LSP y treesitter los parsers."
