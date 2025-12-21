#!/bin/bash

REPO_RAW="https://raw.githubusercontent.com/mhbs12/BrUS/main/linux/symbols/brus"
DEST_DIR="$HOME/.config/xkb/symbols"
AUTOSTART_DIR="$HOME/.config/autostart"
HYPR_CONF="$HOME/.config/hypr/hyprland.conf"
ACTIVATE_SCRIPT="$HOME/.brus-activate.sh"

mkdir -p "$DEST_DIR"
mkdir -p "$AUTOSTART_DIR"

# Baixa o layout para permitir o teste
curl -sL "$REPO_RAW" -o "$DEST_DIR/brus"

# Salva o layout atual para backup (X11)
OLD_LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}')
OLD_VARIANT=$(setxkbmap -query | grep variant | awk '{print $2}')

echo "--- MODO DE TESTE ---"
echo "Aplicando BrUS-v1 temporariamente..."
setxkbmap -layout brus -variant BrUS-v1 -print | xkbcomp -I$HOME/.config/xkb - $DISPLAY 2>/dev/null

echo "O layout está ativo. Teste as teclas e a camada AltGr + Espaço."
read -p "Pressione [ENTER] para encerrar o teste..."

read -p "Deseja manter o BrUS-v1 como seu layout padrão? (s/n): " CONFIRM

if [[ "$CONFIRM" =~ ^[sS]$ ]]; then
    # 1. Configuração de Inicialização (X11)
    echo "#!/bin/bash" > "$ACTIVATE_SCRIPT"
    echo "setxkbmap -layout brus -variant BrUS-v1 -print | xkbcomp -I$HOME/.config/xkb - \$DISPLAY" >> "$ACTIVATE_SCRIPT"
    chmod +x "$ACTIVATE_SCRIPT"

    cat << EOF > "$AUTOSTART_DIR/brus-layout.desktop"
[Desktop Entry]
Type=Application
Exec=$ACTIVATE_SCRIPT
Name=BrUS Keyboard Layout
EOF

    # 2. Configuração Hyprland
    if [ -f "$HYPR_CONF" ]; then
        if ! grep -q "kb_layout = brus" "$HYPR_CONF"; then
            echo -e "\ninput {\n    kb_layout = brus\n    kb_variant = BrUS-v1\n}" >> "$HYPR_CONF"
        fi
    fi

    # 3. Configuração GNOME
    if command -v gsettings >/dev/null 2>&1; then
        gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'brus+BrUS-v1')]"
    fi

    echo "Instalação finalizada e definida como padrão!"
else
    # Restaura o layout anterior
    echo "Restaurando layout anterior ($OLD_LAYOUT)..."
    if [ -n "$OLD_VARIANT" ]; then
        setxkbmap -layout "$OLD_LAYOUT" -variant "$OLD_VARIANT"
    else
        setxkbmap -layout "$OLD_LAYOUT"
    fi
    # Remove o arquivo baixado para limpar o sistema
    rm "$DEST_DIR/brus"
    echo "Alterações descartadas."
fi
