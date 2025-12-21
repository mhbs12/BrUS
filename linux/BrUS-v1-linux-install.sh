#!/bin/bash

REPO_RAW="https://raw.githubusercontent.com/mhbs12/BrUS/main/linux/symbols/brus"
DEST_DIR="$HOME/.config/xkb/symbols"
AUTOSTART_DIR="$HOME/.config/autostart"
HYPR_CONF="$HOME/.config/hypr/hyprland.conf"
ACTIVATE_SCRIPT="$HOME/.brus-activate.sh"

echo "Instalando BrUS-v1..."

mkdir -p "$DEST_DIR"
mkdir -p "$AUTOSTART_DIR"

# Baixa o mapa de teclas do repositório
curl -sL "$REPO_RAW" -o "$DEST_DIR/brus"

# 1. Configuração de Inicialização (X11)
echo "#!/bin/bash" > "$ACTIVATE_SCRIPT"
echo "setxkbmap -layout brus -variant BrUS-v1 -print | xkbcomp -I$HOME/.config/xkb - \$DISPLAY" >> "$ACTIVATE_SCRIPT"
chmod +x "$ACTIVATE_SCRIPT"

cat << EOF > "$AUTOSTART_DIR/brus-layout.desktop"
[Desktop Entry]
Type=Application
Exec=$ACTIVATE_SCRIPT
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=BrUS Keyboard Layout
Comment=Aplica o layout BrUS-v1 no login
EOF

# 2. Configuração para Hyprland (Wayland)
if [ -f "$HYPR_CONF" ]; then
    if ! grep -q "kb_layout = brus" "$HYPR_CONF"; then
        echo -e "\ninput {\n    kb_layout = brus\n    kb_variant = BrUS-v1\n}" >> "$HYPR_CONF"
        echo "Configuração adicionada ao Hyprland. Recarregue o Hyprland para aplicar."
    fi
fi

# 3. Configuração para GNOME (Wayland/X11)
if command -v gsettings >/dev/null 2>&1; then
    gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'brus+BrUS-v1')]"
    echo "Configuração aplicada via gsettings (GNOME)."
fi

# 4. Aplicação imediata para a sessão atual (X11)
if [ -n "$DISPLAY" ]; then
    sh "$ACTIVATE_SCRIPT" 2>/dev/null
fi

echo "---"
echo "Sucesso! O layout BrUS-v1 foi instalado."
echo "Se estiver no Hyprland, salve seu config ou reinicie a sessão."
