#!/bin/bash

REPO_RAW="https://raw.githubusercontent.com/mhbs12/BrUS/main/linux/symbols/brus"
DEST_DIR="$HOME/.config/xkb/symbols"
AUTOSTART_DIR="$HOME/.config/autostart"
HYPR_CONF="$HOME/.config/hypr/hyprland.conf"
ACTIVATE_SCRIPT="$HOME/.brus-activate.sh"

echo "Instalando BrUS-v1..."

# Cria o diretório de símbolos e baixa o arquivo
mkdir -p "$DEST_DIR"

# Baixa o mapa de teclas do repositório
if curl -sL "$REPO_RAW" -o "$DEST_DIR/brus"; then
    echo "✓ Arquivo de símbolos baixado para $DEST_DIR/brus"
else
    echo "✗ Erro ao baixar o arquivo de símbolos"
    exit 1
fi

echo ""
echo "---"
echo "Instalação do arquivo de símbolos concluída!"
echo ""

# Instruções para Hyprland
if [ -f "$HYPR_CONF" ]; then
    echo "📝 Para Hyprland, adicione ou edite o seguinte no seu ~/.config/hypr/hyprland.conf:"
    echo ""
    echo "input {"
    echo "    kb_layout = brus"
    echo "    kb_variant = BrUS-v1"
    echo "    # ... suas outras configurações de input ..."
    echo "}"
    echo ""
    echo "Depois, recarregue o Hyprland para aplicar."
    echo ""
fi

# Pergunta se o usuário deseja ativar o layout agora
echo "---"
read -p "Deseja ativar o layout agora? (s/N): " -n 1 -r ACTIVATE_NOW
echo ""

if [[ $ACTIVATE_NOW =~ ^[YySs]$ ]]; then
    # Cria o diretório de autostart
    mkdir -p "$AUTOSTART_DIR"
    
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
    echo "✓ Autostart configurado em $AUTOSTART_DIR/brus-layout.desktop"

    # 2. Configuração para GNOME (Wayland/X11)
    if command -v gsettings >/dev/null 2>&1; then
        gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'brus+BrUS-v1')]"
        echo "✓ Configuração aplicada via gsettings (GNOME)"
    fi

    # 3. Aplicação imediata para a sessão atual (X11)
    if [ -n "$DISPLAY" ]; then
        if bash "$ACTIVATE_SCRIPT" 2>/dev/null; then
            echo "✓ Layout BrUS-v1 ativado para a sessão atual (X11)"
        else
            echo "⚠ Não foi possível ativar o layout imediatamente (pode não estar em X11)"
        fi
    fi
    
    echo ""
    echo "Sucesso! O layout BrUS-v1 foi instalado e ativado."
else
    echo ""
    echo "Layout não ativado. Você pode ativar manualmente mais tarde:"
    echo "  - Para X11: execute o script de ativação ou use as ferramentas do seu ambiente"
    echo "  - Para Hyprland: adicione as configurações acima ao seu hyprland.conf"
    echo "  - Para GNOME: use as configurações de teclado do sistema"
    echo ""
    echo "Sucesso! O layout BrUS-v1 foi instalado."
fi
