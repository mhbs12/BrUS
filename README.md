<div align="center">

# 🇧🇷 BrUS Keyboard Layout

### *O melhor dos dois mundos: layout US com suporte completo ao Português Brasileiro*

[![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/mhbs12/BrUS/releases)
[![Version](https://img.shields.io/badge/Version-1.0-brightgreen?style=for-the-badge)](https://github.com/mhbs12/BrUS)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)
[![Made with ❤️](https://img.shields.io/badge/Made%20with-❤️-red?style=for-the-badge)](https://github.com/mhbs12)

---

<img src="https://raw.githubusercontent.com/mhbs12/BrUS/main/assets/keyboard-preview.png" alt="BrUS Keyboard Preview" width="800">

*Layout de teclado customizado para programadores brasileiros*

</div>

---

## 📖 Sobre

O **BrUS** é um layout de teclado customizado que combina a eficiência do teclado **US (Estados Unidos)** com suporte completo para **caracteres acentuados do Português Brasileiro**. 

### 🎯 O Diferencial

O principal objetivo do BrUS é permitir **digitar acentos diretamente com uma única combinação de teclas** usando `AltGr` (Alt Direito), **sem precisar de teclas mortas**. Isso significa que você pode digitar `á`, `é`, `ç`, `ã` e outros caracteres acentuados de forma rápida e direta, ideal para programadores que precisam alternar entre código e texto em português.

### ✨ Características Principais

| 🎯 Recurso | 📝 Descrição |
|-----------|-------------|
| **Acentos Diretos com AltGr** | Digite `á`, `é`, `ç`, `ã`, `õ` diretamente com `Alt Direito + tecla` - sem teclas mortas! |
| **Base US Layout** | Mantém todos os símbolos de programação em posições familiares |
| **Camada Numérica** | Acesso rápido a números e símbolos usando `AltGr+Space` |
| **Símbolos Internacionais** | Suporte a €, £, ¥, ©, ®, µ, ß e muito mais |
| **Dead Keys (Opcional)** | Teclas mortas (^, `, ~) disponíveis como alternativa |

---

## 🚀 Instalação no Windows

### Pré-requisitos

- Windows 10 ou superior
- Permissões de administrador

### Método 1: Instalador Automático (Recomendado)

1. **Baixe** o instalador da [página de releases](https://github.com/mhbs12/BrUS/releases)
2. **Execute** o arquivo `setup.exe` como administrador
3. **Reinicie** o computador
4. **Ative** o layout em `Configurações > Hora e Idioma > Idioma > Opções de idioma`

### Método 2: Compilação Manual

<details>
<summary>📦 Clique para expandir instruções detalhadas</summary>

#### Passo 1: Instale o Microsoft Keyboard Layout Creator (MSKLC)

```
1. Baixe o MSKLC: https://www.microsoft.com/en-us/download/details.aspx?id=102134
2. Execute o instalador
3. Siga as instruções de instalação
```

#### Passo 2: Compile o Layout

```
1. Abra o MSKLC
2. File > Load Source File...
3. Selecione o arquivo BrUS.klc
4. Project > Build DLL and Setup Package
5. Escolha uma pasta de destino
```

#### Passo 3: Instale o Layout

```
1. Navegue até a pasta de destino
2. Execute setup.exe como administrador
3. Reinicie o computador
```

</details>

### 🔄 Ativando o Layout

Após a instalação, ative o BrUS como seu layout padrão:

```
Configurações → Hora e idioma → Idioma e região → Português (Brasil) 
→ Opções → Adicionar um teclado → BrUS
```

> 💡 **Dica:** Use `Win + Espaço` para alternar rapidamente entre layouts de teclado.

---

## ⌨️ Guia de Atalhos

### 🔤 Camada Base (Normal)

O layout base é idêntico ao US QWERTY padrão:

```
┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────────┐
│  `  │  1  │  2  │  3  │  4  │  5  │  6  │  7  │  8  │  9  │  0  │  -  │  =  │ Backsp  │
├─────┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──────┤
│  Tab   │  Q  │  W  │  E  │  R  │  T  │  Y  │  U  │  I  │  O  │  P  │  [  │  ]  │   \  │
├────────┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴──────┤
│  Caps    │  A  │  S  │  D  │  F  │  G  │  H  │  J  │  K  │  L  │  ;  │  '  │   Enter  │
├──────────┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──────────┤
│    Shift    │  Z  │  X  │  C  │  V  │  B  │  N  │  M  │  ,  │  .  │  /  │    Shift    │
├─────────┬───┴──┬──┴───┬─┴─────┴─────┴─────┴─────┴─────┴──┬──┴───┬─┴────┬┴────┬────────┤
│  Ctrl   │ Win  │ Alt  │             Space                │ AltGr│ Win  │ Menu│  Ctrl  │
└─────────┴──────┴──────┴──────────────────────────────────┴──────┴──────┴─────┴────────┘
```

### ⇧ Camada Shift

```
┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────────┐
│  ~  │  !  │  @  │  #  │  $  │  %  │  ^  │  &  │  *  │  (  │  )  │  _  │  +  │ Backsp  │
├─────┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──────┤
│  Tab   │  Q  │  W  │  E  │  R  │  T  │  Y  │  U  │  I  │  O  │  P  │  {  │  }  │   |  │
├────────┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴──────┤
│  Caps    │  A  │  S  │  D  │  F  │  G  │  H  │  J  │  K  │  L  │  :  │  "  │   Enter  │
├──────────┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──────────┤
│    Shift    │  Z  │  X  │  C  │  V  │  B  │  N  │  M  │  <  │  >  │  ?  │    Shift    │
└─────────────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────────────┘
```

---

## 🎨 Camada AltGr - Acentos Diretos (Alt Direito ou Ctrl+Alt)

> ⚠️ **Nota:** Em teclados US, a tecla `AltGr` é a tecla **Alt direita** (Right Alt). Você também pode usar `Ctrl + Alt` como alternativa.

A camada AltGr é o **recurso principal** do BrUS! Com ela você digita caracteres acentuados **diretamente**, sem precisar de teclas mortas:

```
┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────────┐
│  '  │  ¡  │  ²  │  ³  │  ¤  │  €  │  ¼  │  ½  │  ¾  │  '  │  '  │  ¥  │  ×  │ Backsp  │
├─────┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──────┤
│  Tab   │  â  │  à  │  é  │  ®  │  þ  │  ü  │  ú  │  í  │  ó  │  õ  │  «  │  »  │   ¬  │
├────────┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴──────┤
│  Caps    │  á  │  ã  │  ê  │  (  │  )  │  _  │  =  │  +  │  -  │  ô  │  ¶  │   Enter  │
├──────────┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──────────┤
│    Shift    │  æ  │  ~  │  ç  │  ©  │  ß  │  ñ  │  µ  │  ð  │  ø  │  ¿  │    Shift    │
└─────────────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────────────┘
```

### 📋 Acentos Diretos com AltGr (Principal)

| Atalho | Caractere | Descrição |
|--------|-----------|-----------|
| `AltGr + A` | á | A com acento agudo |
| `AltGr + E` | é | E com acento agudo |
| `AltGr + I` | í | I com acento agudo |
| `AltGr + O` | ó | O com acento agudo |
| `AltGr + U` | ú | U com acento agudo |
| `AltGr + S` | ã | A com til |
| `AltGr + P` | õ | O com til |
| `AltGr + N` | ñ | N com til |
| `AltGr + C` | ç | C cedilha |
| `AltGr + Q` | â | A com circunflexo |
| `AltGr + W` | à | A com acento grave |
| `AltGr + D` | ê | E com circunflexo |
| `AltGr + ;` | ô | O com circunflexo |
| `AltGr + Y` | ü | U com trema |

### 🔢 Símbolos Especiais com AltGr

| Atalho | Caractere | Descrição |
|--------|-----------|-----------|
| `AltGr + 5` | € | Euro |
| `AltGr + 4` | ¤ | Símbolo de moeda |
| `AltGr + -` | ¥ | Yen |
| `AltGr + R` | ® | Marca registrada |
| `AltGr + V` | © | Copyright |
| `AltGr + M` | µ | Micro |
| `AltGr + B` | ß | Eszett (alemão) |
| `AltGr + 2` | ² | Superscript 2 |
| `AltGr + 3` | ³ | Superscript 3 |
| `AltGr + =` | × | Multiplicação |
| `AltGr + 6` | ¼ | Fração 1/4 |
| `AltGr + 7` | ½ | Fração 1/2 |
| `AltGr + 8` | ¾ | Fração 3/4 |
| `AltGr + [` | « | Aspas angulares esquerda |
| `AltGr + ]` | » | Aspas angulares direita |

### ⌨️ Atalhos de Programação com AltGr

| Atalho | Caractere | Uso |
|--------|-----------|-----|
| `AltGr + F` | ( | Parêntese esquerdo |
| `AltGr + G` | ) | Parêntese direito |
| `AltGr + H` | _ | Underscore |
| `AltGr + J` | = | Igual |
| `AltGr + K` | + | Mais |
| `AltGr + L` | - | Menos |

### 🔣 Camada Shift + AltGr

Alguns caracteres adicionais estão disponíveis com `Shift + AltGr`:

| Atalho | Caractere | Descrição |
|--------|-----------|-----------|
| `Shift + AltGr + 1` | ¹ | Superscript 1 |
| `Shift + AltGr + 4` | £ | Libra |
| `Shift + AltGr + =` | ÷ | Divisão |
| `Shift + AltGr + ;` | ° | Grau |
| `Shift + AltGr + '` | ¨ | Trema |
| `Shift + AltGr + ,` | Ç | C cedilha maiúsculo |

---

## 📝 Dead Keys - Teclas Mortas (Alternativa)

> 💡 **Nota:** As teclas mortas são uma **opção secundária**. O método principal e recomendado é usar os acentos diretos com AltGr descritos acima.

As teclas mortas permitem criar caracteres acentuados pressionando primeiro o acento e depois a vogal. Úteis para caracteres menos comuns não mapeados na camada AltGr.

### ^ Circunflexo (`Shift + 6`)

| Sequência | Resultado |
|-----------|-----------|
| `^` + `a` | â |
| `^` + `e` | ê |
| `^` + `i` | î |
| `^` + `o` | ô |
| `^` + `u` | û |
| `^` + `A` | Â |
| `^` + `E` | Ê |
| `^` + `I` | Î |
| `^` + `O` | Ô |
| `^` + `U` | Û |
| `^` + `Space` | ^ |

### \` Grave (tecla `)

| Sequência | Resultado |
|-----------|-----------|
| `` ` `` + `a` | à |
| `` ` `` + `e` | è |
| `` ` `` + `i` | ì |
| `` ` `` + `o` | ò |
| `` ` `` + `u` | ù |
| `` ` `` + `A` | À |
| `` ` `` + `E` | È |
| `` ` `` + `I` | Ì |
| `` ` `` + `O` | Ò |
| `` ` `` + `U` | Ù |
| `` ` `` + `Space` | ` |

### ~ Til / Tilde (`Shift + \`)

| Sequência | Resultado |
|-----------|-----------|
| `~` + `a` | ã |
| `~` + `n` | ñ |
| `~` + `o` | õ |
| `~` + `A` | Ã |
| `~` + `N` | Ñ |
| `~` + `O` | Õ |
| `~` + `Space` | ~ |

---

## 🔢 Camada Numérica (AltGr + Space)

Uma característica especial do BrUS é a camada numérica ativada por `AltGr + Space`. Pressione `AltGr + Space` (dead key) e depois a tecla desejada:

### Números na Home Row

```
┌───────────────────────────────────────────────────────────────┐
│                    CAMADA NUMÉRICA                            │
│                                                               │
│   q=DEL   w=BS   e=!   r=@   t=#   y=$   u=%   i=^   o=&   p=*│
│                                                               │
│   a=1     s=2    d=3   f=4   g=5   h=6   j=7   k=8   l=9   ;=0│
│                                                               │
└───────────────────────────────────────────────────────────────┘
```

| Sequência | Resultado | Descrição |
|-----------|-----------|-----------|
| `AltGr+Space` → `a` | 1 | Número 1 |
| `AltGr+Space` → `s` | 2 | Número 2 |
| `AltGr+Space` → `d` | 3 | Número 3 |
| `AltGr+Space` → `f` | 4 | Número 4 |
| `AltGr+Space` → `g` | 5 | Número 5 |
| `AltGr+Space` → `h` | 6 | Número 6 |
| `AltGr+Space` → `j` | 7 | Número 7 |
| `AltGr+Space` → `k` | 8 | Número 8 |
| `AltGr+Space` → `l` | 9 | Número 9 |
| `AltGr+Space` → `;` | 0 | Número 0 |

### Símbolos na Top Row

| Sequência | Resultado | Descrição |
|-----------|-----------|-----------|
| `AltGr+Space` → `q` | DEL | Delete |
| `AltGr+Space` → `w` | BS | Backspace |
| `AltGr+Space` → `e` | ! | Exclamação |
| `AltGr+Space` → `r` | @ | Arroba |
| `AltGr+Space` → `t` | # | Hash/Cerquilha |
| `AltGr+Space` → `y` | $ | Cifrão |
| `AltGr+Space` → `u` | % | Porcentagem |
| `AltGr+Space` → `i` | ^ | Circunflexo |
| `AltGr+Space` → `o` | & | E comercial |
| `AltGr+Space` → `p` | * | Asterisco |

---

## 💡 Exemplos de Uso

### Escrevendo em Português

```
"Você está fazendo um ótimo trabalho!"

Como digitar (método principal - AltGr):
- ê: AltGr + D
- á: AltGr + A
- ó: AltGr + O

Alternativa com teclas mortas:
- ê: ^ + e
```

### Programação com Símbolos

```python
# Usando AltGr para símbolos matemáticos
resultado = 10 × 5 ÷ 2  # × com AltGr+=, ÷ com Shift+AltGr+=

# Copyright e marca registrada
print("© 2025 Empresa®")  # © com AltGr+V, ® com AltGr+R
```

---

## 🆚 Comparação com Outros Layouts

| Recurso | BrUS | ABNT2 | US International |
|---------|------|-------|------------------|
| Base US | ✅ | ❌ | ✅ |
| Acentos diretos | ✅ | ✅ | ❌ |
| Dead keys | ✅ | ✅ | ✅ |
| Camada numérica | ✅ | ❌ | ❌ |
| Cedilha fácil | ✅ | ✅ | ❌ |
| Símbolos de programação | ✅ | ❌ | ✅ |

---

## 🛠️ Desenvolvimento

### Editando o Layout

1. Instale o [Microsoft Keyboard Layout Creator](https://www.microsoft.com/en-us/download/details.aspx?id=102134)
2. Abra o arquivo `BrUS.klc`
3. Faça suas modificações
4. Compile e teste

### Contribuindo

1. Faça um Fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

---

## 📄 Licença

Distribuído sob a licença MIT. Veja `LICENSE` para mais informações.

---

## 👤 Autor

**Murilo Beraldo**
- GitHub: [@mhbs12](https://github.com/mhbs12)

<div align="center">

### ⭐ Se este projeto te ajudou, deixe uma estrela!

[![GitHub stars](https://img.shields.io/github/stars/mhbs12/BrUS?style=social)](https://github.com/mhbs12/BrUS/stargazers)

**Feito com ❤️ no Brasil 🇧🇷**

</div>
