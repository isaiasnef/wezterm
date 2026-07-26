<h2 align="center">Configuración de WezTerm</h2>

<p align="center">
  <img alt="WezTerm" src="https://img.shields.io/badge/WezTerm-20240127%2B-8CA2D6?style=for-the-badge&logo=windowsterminal&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41">
</p>

---

### Características

- **Transparencia / frosted glass** — Opacidad 85 % + blur en macOS.
- **Selección automática de GPU** — Elige la mejor GPU y API gráfica disponible.
- **Teclado 60% ISO Español** — Atajos optimizados sin teclas F ni flechas dedicadas.
- **Modificadores portátiles** — Atajos consistentes entre macOS, Windows y Linux.
- **Tablas de teclas persistentes** — Modos `resize_font` y `resize_pane` sin timeout.
- **Pestañas transparentes** — `active_titlebar_bg = 'none'` para efecto uniforme.
- **Shell Fish + Pure** — Prompt minimalista con colores ámbar/dorado.
- **Hyperlinks automáticos** — Detección de URLs en múltiples formatos.

---

### Atajos de teclado

Los atajos se muestran para cada sistema operativo. Usa la tabla según tu plataforma.

> **Nota:** Configurado para teclado 60% ISO Español. Sin teclas F, sin flechas, sin PageUp/PageDown.  
> En **Windows/Linux**, las teclas `f`, `r`, `u`, `d`, `Backspace` usan `Alt+Ctrl` en vez de `Alt` para no conflictuar con atajos de fish (avanzar palabra, kill-word, etc.).

#### Convención de modificadores

| Modificador | macOS | Linux | Windows |
|---|---|---|---|
| `SUPER` | `Cmd` | `Alt` | `Alt` |
| `SUPER_REV` | `Cmd`+`Ctrl` | `Alt`+`Ctrl` | `Alt`+`Ctrl` |
| `LEADER` | `Cmd`+`Ctrl`+`a` (3s timeout) | `Alt`+`Ctrl`+`a` (3s timeout) | `Alt`+`Ctrl`+`a` (3s timeout) |

#### Generales

| Acción | macOS | Linux | Windows |
|---|---|---|---|
| Aumentar fuente | `Cmd` + `k` | `Alt` + `k` | `Alt` + `k` |
| Disminuir fuente | `Cmd` + `j` | `Alt` + `j` | `Alt` + `j` |
| Restablecer fuente | `Cmd` + `r` | `Alt` + `Ctrl` + `r` | `Alt` + `Ctrl` + `r` |
| Buscar texto | `Cmd` + `f` | `Alt` + `Ctrl` + `f` | `Alt` + `Ctrl` + `f` |
| Abrir URL bajo cursor | `Cmd` + `Ctrl` + `u` | `Alt` + `Ctrl` + `u` | `Alt` + `Ctrl` + `u` |
| Limpiar línea | `Cmd` + `Backspace` | `Alt` + `Ctrl` + `Backspace` | `Alt` + `Ctrl` + `Backspace` |
| Copiar | `Ctrl` + `Shift` + `c` | `Ctrl` + `Shift` + `c` | `Ctrl` + `Shift` + `c` |
| Pegar | `Ctrl` + `Shift` + `v` | `Ctrl` + `Shift` + `v` | `Ctrl` + `Shift` + `v` |
| Abrir enlace | `Ctrl` + clic izquierdo | `Ctrl` + clic izquierdo | `Ctrl` + clic izquierdo |

#### Pestañas

| Acción | macOS | Linux / Windows |
|---|---|---|
| Nueva pestaña (default) | `Cmd` + `t` | `Alt` + `t` |
| Nueva pestaña (WSL Ubuntu) | `Cmd` + `Ctrl` + `t` | `Alt` + `Ctrl` + `t` |
| Cerrar pestaña | `Cmd` + `Ctrl` + `w` | `Alt` + `Ctrl` + `w` |
| Pestaña anterior / siguiente | `Cmd` + `[` / `]` | `Alt` + `[` / `]` |
| Mover pestaña izq. / der. | `Cmd` + `Ctrl` + `[` / `]` | `Alt` + `Ctrl` + `[` / `]` |
| Ocultar/mostrar barra | `Cmd` + `9` | `Alt` + `9` |

#### Paneles (panes)

| Acción | macOS | Linux / Windows |
|---|---|---|
| Panel horizontal (apilado) | `Cmd` + `Shift` + `h` | `Alt` + `Shift` + `h` |
| Panel vertical (lado a lado) | `Cmd` + `Shift` + `v` | `Alt` + `Shift` + `v` |
| Maximizar/restaurar panel | `Cmd` + `Enter` | `Alt` + `Enter` |
| Cerrar panel | `Cmd` + `w` | `Alt` + `w` |
| Navegar panes (vim-style) | `Cmd` + `Ctrl` + `h`/`j`/`k`/`l` | `Alt` + `Ctrl` + `h`/`j`/`k`/`l` |
| Intercambiar panel | `Cmd` + `Ctrl` + `p` | `Alt` + `Ctrl` + `p` |
| Desplazar 5 líneas | `Cmd` + `u` / `d` | `Alt` + `Ctrl` + `u` / `d` |
| Desplazar página | `Cmd` + `Shift` + `u` / `d` | `Alt` + `Ctrl` + `Shift` + `u` / `d` |

#### Ventanas

| Acción | macOS | Linux / Windows |
|---|---|---|
| Nueva ventana | `Cmd` + `n` | `Alt` + `n` |
| Reducir tamaño (-50px) | `Cmd` + `Ctrl` + `s` | `Alt` + `Ctrl` + `s` |
| Aumentar tamaño (+50px) | `Cmd` + `Ctrl` + `e` | `Alt` + `Ctrl` + `e` |
| Maximizar ventana | `Cmd` + `Ctrl` + `Enter` | `Alt` + `Ctrl` + `Enter` |

#### Acciones LEADER (una tecla)

Presiona `LEADER` (`Cmd`+`Ctrl`+`a` en macOS / `Alt`+`Ctrl`+`a` en Win/Linux) y luego:

| Tecla | Acción |
|---|---|
| `c` | Modo copia |
| `,` | Paleta de comandos |
| `Space` | Lanzador |
| `Enter` | Pantalla completa |
| `d` | Superposición de depuración |
| `v` | Panel vertical |
| `h` | Panel horizontal |
| `b` | Ocultar/mostrar barra |

#### Modos persistentes (LEADER + tecla)

| Tecla | Modo |
|---|---|
| `f` | `resize_font` |
| `p` | `resize_pane` |

Dentro del modo, usa `k`/`j` (fuente) o `h`/`j`/`k`/`l` (paneles).  
`Esc` o `q` para salir.

---

### Shell (Fish + Pure)

Fish es el shell predeterminado de esta configuración con el tema **Pure** y colores ámbar/dorado que combinan con las pestañas activas (`#ae8b2d`).

#### Instalación de Fish

| Plataforma | Comando |
|---|---|
| **macOS** | `brew install fish` |
| **Linux (Debian/Ubuntu)** | `sudo apt install fish` |
| **Linux (Arch)** | `sudo pacman -S fish` |
| **Linux (Fedora)** | `sudo dnf install fish` |
| **Windows** | `winget install Fish.Fish` o `scoop install fish` |

#### Tema Pure + Oh My Fish

```sh
# Instalar Oh My Fish
curl -sL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Instalar y activar tema Pure
omf install pure
omf theme pure

# Colores dorado/ámbar (coincide con pestañas activas)
set -U pure_color_primary "ae8b2d"
set -U pure_color_current_directory "ae8b2d"
set -U pure_color_prompt_on_success "ae8b2d"
set -U pure_color_success "ae8b2d"
set -U pure_color_info "fab387"
set -U pure_color_mute "9ca0b0"
set -U pure_color_danger "d35c5c"
set -U pure_color_warning "e5c07b"
set -U pure_color_prompt_on_error "d35c5c"

# Configurar como default_prog en WezTerm (macOS/Linux)
# fish -l
```

> **Nota:** Si cambiaste de tema y quieres volver a Pure, ejecuta `omf theme pure`.

---

### Estructura del proyecto

```
~/.config/wezterm/
├── wezterm.lua            # Punto de entrada
├── config/
│   ├── init.lua           # Clase Config (builder)
│   ├── appearance.lua     # Apariencia, GPU, cursor, colores
│   ├── bindings.lua       # Atajos de teclado
│   ├── domains.lua        # Dominios SSH/WSL
│   ├── fonts.lua          # Fuente y tamaño
│   ├── general.lua        # Comportamiento general, hyperlinks
│   └── launch.lua         # Shell predeterminado y menú
├── events/
│   ├── tab-title.lua      # Formato de pestañas + toggle barra
│   └── gui-startup.lua    # Maximizar ventana al inicio
├── utils/
│   ├── gpu-adapter.lua    # Selector inteligente de GPU
│   └── platform.lua       # Detección de SO
├── .luacheckrc
├── .luarc.json
└── .stylua.toml
```

---

### Instalación

#### macOS

```sh
# 1. Instalar WezTerm
brew install --cask wezterm

# 2. Nerd Font (requerida para glifos)
brew install --cask font-jetbrains-mono-nerd-font

# 3. Clonar configuración
git clone https://github.com/isaiasnef/wezterm.git ~/.config/wezterm

# 4. Instalar Fish (recomendado)
brew install fish
```

#### Linux

```sh
# 1. Instalar WezTerm (descargar .deb/.rpm/.AppImage desde https://wezterm.org)
#    o vía gestor de paquetes si está disponible

# 2. Nerd Font
#    Descargar JetBrainsMono Nerd Font desde https://www.nerdfonts.com/

# 3. Clonar configuración
git clone https://github.com/isaiasnef/wezterm.git ~/.config/wezterm

# 4. Instalar Fish
sudo apt install fish          # Debian/Ubuntu
sudo pacman -S fish            # Arch
sudo dnf install fish          # Fedora
```

#### Windows

```powershell
# 1. Instalar WezTerm
winget install wezterm

# 2. Nerd Font
#    Descargar e instalar JetBrainsMono Nerd Font desde https://www.nerdfonts.com/

# 3. Clonar configuración
git clone https://github.com/isaiasnef/wezterm.git $env:USERPROFILE\.config\wezterm

# 4. Ajustes necesarios
#    - Editar config\launch.lua: cambiar default_prog a 'powershell' o 'pwsh'
#    - Editar config\domains.lua: cambiar 'kevin' por tu usuario de Windows
```

#### Post-instalación (todas las plataformas)

```sh
# Configurar Fish + Pure (ver sección "Shell (Fish + Pure)" arriba)
curl -sL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install pure
omf theme pure
```

> **Requisitos:**
> - WezTerm `20240127-113634-bbcac864` o superior
> - [JetBrainsMono Nerd Font](https://www.nerdfonts.com/)
> - Fish shell `≥3.x` (recomendado)

---

### Referencias

- <https://github.com/wez/wezterm>
- <https://github.com/KevinSilvester/wezterm-config> — inspiración original
- <https://github.com/catppuccin/wezterm>
