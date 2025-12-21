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
    echo ""
    
    # Instruções adicionais baseadas no ambiente
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        echo "───────────────────────────────────────────────────────────────────────────"
        echo "ℹ️  NOTA: Você está em uma sessão Wayland"
        echo ""
        
        if [ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$DESKTOP_SESSION" = "plasma" ]; then
            echo "Para KDE Plasma Wayland, você também precisa configurar manualmente:"
            echo ""
            echo "1. Abra as Configurações do Sistema:"
            echo "   Menu → Configurações do Sistema"
            echo "   # OU execute: systemsettings5"
            echo ""
            echo "2. Navegue até:"
            echo "   Dispositivos de Entrada → Teclado → Layouts"
            echo ""
            echo "3. Clique em 'Adicionar' e procure por:"
            echo "   Português (Brasil, BrUS-v1)"
            echo "   # OU busque por: brus"
            echo ""
            echo "4. Adicione o layout e mova para o topo se quiser usá-lo como padrão"
            echo ""
            echo "5. Clique em 'Aplicar'"
            echo ""
        elif [[ "$XDG_CURRENT_DESKTOP" =~ "XFCE" ]]; then
            echo "Para XFCE Wayland, você também precisa configurar manualmente:"
            echo ""
            echo "1. Abra as Configurações:"
            echo "   Menu → Configurações → Teclado"
            echo ""
            echo "2. Vá para a aba 'Layout'"
            echo ""
            echo "3. Desmarque 'Usar padrões do sistema'"
            echo ""
            echo "4. Clique em 'Adicionar' e procure por:"
            echo "   Português (Brasil, BrUS-v1)"
            echo ""
            echo "5. Adicione o layout e clique em 'Fechar'"
            echo ""
        elif [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ] || [ -f "$HYPR_CONF" ]; then
            echo "Para Hyprland, você precisa configurar manualmente:"
            echo ""
            echo "1. Abra o arquivo de configuração:"
            echo "   nano ~/.config/hypr/hyprland.conf"
            echo ""
            echo "2. Adicione ou edite o bloco 'input' com:"
            echo "   input {"
            echo "       kb_layout = brus"
            echo "       kb_variant = BrUS-v1"
            echo "       # ... suas outras configurações de input ..."
            echo "   }"
            echo ""
            echo "3. Salve o arquivo (Ctrl+O, Enter, Ctrl+X)"
            echo ""
            echo "4. Recarregue a configuração:"
            echo "   hyprctl reload"
            echo "   # OU pressione: Super+Shift+C (se configurado)"
            echo ""
        fi
        echo "───────────────────────────────────────────────────────────────────────────"
    fi
else
    echo ""
    echo "Layout não ativado automaticamente."
    echo ""
    echo "═══════════════════════════════════════════════════════════════════════════"
    echo "📖 COMO ATIVAR O LAYOUT POSTERIORMENTE"
    echo "═══════════════════════════════════════════════════════════════════════════"
    echo ""
    echo "Você tem duas opções para ativar o layout BrUS-v1:"
    echo ""
    
    # Detecta o ambiente de desktop
    DETECTED_ENV=""
    if [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ] || [ -f "$HYPR_CONF" ]; then
        DETECTED_ENV="hyprland"
    elif [ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$DESKTOP_SESSION" = "plasma" ]; then
        DETECTED_ENV="kde"
    elif [[ "$XDG_CURRENT_DESKTOP" =~ "XFCE" ]]; then
        DETECTED_ENV="xfce"
    elif [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || [ "$DESKTOP_SESSION" = "gnome" ]; then
        DETECTED_ENV="gnome"
    fi
    
    # Exibe instruções para o ambiente detectado primeiro
    if [ "$DETECTED_ENV" = "hyprland" ]; then
        echo "🖥️  HYPRLAND (detectado)"
        echo "───────────────────────────────────────────────────────────────────────────"
        echo "OPÇÃO 1 - Configuração manual (recomendado para Hyprland):"
        echo ""
        echo "1. Abra o arquivo de configuração:"
        echo "   nano ~/.config/hypr/hyprland.conf"
        echo ""
        echo "2. Adicione ou edite o bloco 'input' com:"
        echo "   input {"
        echo "       kb_layout = brus"
        echo "       kb_variant = BrUS-v1"
        echo "       # ... suas outras configurações de input ..."
        echo "   }"
        echo ""
        echo "3. Salve o arquivo (Ctrl+O, Enter, Ctrl+X)"
        echo ""
        echo "4. Recarregue a configuração:"
        echo "   hyprctl reload"
        echo "   # OU pressione: Super+Shift+C (se configurado)"
        echo ""
        echo "═══════════════════════════════════════════════════════════════════════════"
        echo ""
    elif [ "$DETECTED_ENV" = "kde" ]; then
        if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
            echo "🖥️  KDE PLASMA WAYLAND (detectado)"
            echo "───────────────────────────────────────────────────────────────────────────"
            echo "OPÇÃO 1 - Configuração manual (necessário para Wayland):"
            echo ""
            echo "1. Abra as Configurações do Sistema:"
            echo "   Menu → Configurações do Sistema"
            echo "   # OU execute: systemsettings5"
            echo ""
            echo "2. Navegue até:"
            echo "   Dispositivos de Entrada → Teclado → Layouts"
            echo ""
            echo "3. Clique em 'Adicionar' e procure por:"
            echo "   Português (Brasil, BrUS-v1)"
            echo "   # OU busque por: brus"
            echo ""
            echo "4. Adicione o layout e mova para o topo se quiser usá-lo como padrão"
            echo ""
            echo "5. Clique em 'Aplicar'"
            echo ""
            echo "═══════════════════════════════════════════════════════════════════════════"
            echo ""
        else
            echo "🖥️  KDE PLASMA X11 (detectado)"
            echo "───────────────────────────────────────────────────────────────────────────"
            echo "OPÇÃO 1 - Ativação automática via script (recomendado):"
            echo "  Execute novamente este instalador:"
            echo "  bash BrUS-v1-linux-install.sh"
            echo "  E escolha 's' quando perguntado se deseja ativar"
            echo "  (Isso criará autostart e ativará para a sessão atual)"
            echo ""
            echo "OPÇÃO 2 - Configuração manual via GUI:"
            echo "  Menu → Configurações do Sistema"
            echo "  Dispositivos de Entrada → Teclado → Layouts"
            echo "  Adicione: Português (Brasil, BrUS-v1)"
            echo ""
            echo "═══════════════════════════════════════════════════════════════════════════"
            echo ""
        fi
    elif [ "$DETECTED_ENV" = "xfce" ]; then
        if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
            echo "🖥️  XFCE WAYLAND (detectado)"
            echo "───────────────────────────────────────────────────────────────────────────"
            echo "OPÇÃO 1 - Configuração manual (necessário para Wayland):"
            echo ""
            echo "1. Abra as Configurações:"
            echo "   Menu → Configurações → Teclado"
            echo ""
            echo "2. Vá para a aba 'Layout'"
            echo ""
            echo "3. Desmarque 'Usar padrões do sistema'"
            echo ""
            echo "4. Clique em 'Adicionar' e procure por:"
            echo "   Português (Brasil, BrUS-v1)"
            echo ""
            echo "5. Adicione o layout e clique em 'Fechar'"
            echo ""
            echo "═══════════════════════════════════════════════════════════════════════════"
            echo ""
        else
            echo "🖥️  XFCE X11 (detectado)"
            echo "───────────────────────────────────────────────────────────────────────────"
            echo "OPÇÃO 1 - Ativação automática via script (recomendado):"
            echo "  Execute novamente este instalador:"
            echo "  bash BrUS-v1-linux-install.sh"
            echo "  E escolha 's' quando perguntado se deseja ativar"
            echo "  (Isso criará autostart e ativará para a sessão atual)"
            echo ""
            echo "OPÇÃO 2 - Configuração manual via GUI:"
            echo "  Menu → Configurações → Teclado → Layout"
            echo "  Adicione: Português (Brasil, BrUS-v1)"
            echo ""
            echo "═══════════════════════════════════════════════════════════════════════════"
            echo ""
        fi
    elif [ "$DETECTED_ENV" = "gnome" ]; then
        echo "🖥️  GNOME (detectado)"
        echo "───────────────────────────────────────────────────────────────────────────"
        echo "OPÇÃO 1 - Ativação automática via script (recomendado):"
        echo "  Execute novamente este instalador:"
        echo "  bash BrUS-v1-linux-install.sh"
        echo "  E escolha 's' quando perguntado se deseja ativar"
        echo "  (Isso configurará automaticamente via gsettings)"
        echo ""
        echo "OPÇÃO 2 - Configuração manual via GUI:"
        echo "  1. Abra as Configurações: Menu → Configurações"
        echo "  2. Vá para: Teclado → Fontes de Entrada"
        echo "  3. Clique em '+' para adicionar"
        echo "  4. Procure por 'Português (Brasil, BrUS-v1)'"
        echo "  5. Adicione e defina como padrão se desejar"
        echo ""
        echo "═══════════════════════════════════════════════════════════════════════════"
        echo ""
    fi
    
    # Exibe instruções para outros ambientes comuns
    echo "📋 OUTROS AMBIENTES COMUNS:"
    echo ""
    
    if [ "$DETECTED_ENV" != "hyprland" ]; then
        echo "▸ HYPRLAND:"
        echo "  Edite ~/.config/hypr/hyprland.conf e adicione no bloco 'input':"
        echo "  kb_layout = brus"
        echo "  kb_variant = BrUS-v1"
        echo "  Depois: hyprctl reload"
        echo ""
    fi
    
    if [ "$DETECTED_ENV" != "kde" ]; then
        echo "▸ KDE PLASMA:"
        echo "  Configurações do Sistema → Dispositivos de Entrada → Teclado → Layouts"
        echo "  Adicione: Português (Brasil, BrUS-v1)"
        echo ""
    fi
    
    if [ "$DETECTED_ENV" != "xfce" ]; then
        echo "▸ XFCE:"
        echo "  Menu → Configurações → Teclado → Layout"
        echo "  Adicione: Português (Brasil, BrUS-v1)"
        echo ""
    fi
    
    if [ "$DETECTED_ENV" != "gnome" ]; then
        echo "▸ GNOME:"
        echo "  Execute o instalador e escolha 's' (configura via gsettings)"
        echo "  OU: Configurações → Teclado → Fontes de Entrada"
        echo ""
    fi
    
    echo "▸ SWAY:"
    echo "  Edite ~/.config/sway/config e adicione:"
    echo "  input type:keyboard {"
    echo "      xkb_layout brus"
    echo "      xkb_variant BrUS-v1"
    echo "  }"
    echo "  Depois: swaymsg reload"
    echo ""
    
    echo "▸ i3/Openbox/Outros (X11):"
    echo "  Execute o instalador e escolha 's' (cria script de ativação)"
    echo "  OU configure manualmente nas preferências do seu ambiente"
    echo ""
    
    echo "═══════════════════════════════════════════════════════════════════════════"
    echo ""
    echo "Sucesso! O layout BrUS-v1 foi instalado."
    echo "O arquivo de símbolos está em: ~/.config/xkb/symbols/brus"
fi
