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

Los atajos usan modificadores portátiles para funcionar igual en macOS, Windows y Linux:

| Modificador     | macOS         | Windows/Linux |
| --------------- | ------------- | ------------- |
| `SUPER`         | `Cmd`         | `Alt`         |
| `SUPER_REV`     | `Cmd`+`Ctrl`  | `Alt`+`Ctrl`  |
| `LEADER`        | `Cmd`+`Ctrl`+`a` (timeout: 3s) | `Alt`+`Ctrl`+`a` |

> **Nota:** Configurado para teclado 60% ISO Español. Sin teclas F, sin flechas, sin PageUp/PageDown.

#### Generales

| Teclas                    | Acción                     |
| ------------------------- | -------------------------- |
| `SUPER` + `k`             | Aumentar fuente            |
| `SUPER` + `j`             | Disminuir fuente           |
| `SUPER` + `r`             | Restablecer fuente         |
| `SUPER` + `f`             | Buscar texto               |
| `SUPER_REV` + `u`         | Abrir URL bajo el cursor   |
| `SUPER` + `Backspace`     | Limpiar línea              |
| `Ctrl` + `Shift` + `c`    | Copiar                     |
| `Ctrl` + `Shift` + `v`    | Pegar                      |
| `Ctrl` + clic izquierdo   | Abrir enlace               |

#### Pestañas

| Teclas              | Acción                        |
| ------------------- | ----------------------------- |
| `SUPER` + `t`       | Nueva pestaña (dominio default) |
| `SUPER_REV` + `t`   | Nueva pestaña (WSL Ubuntu)    |
| `SUPER_REV` + `w`   | Cerrar pestaña                |
| `SUPER` + `[` / `]` | Pestaña anterior / siguiente  |
| `SUPER_REV` + `[` / `]` | Mover pestaña izq. / der. |
| `SUPER` + `9`       | Ocultar/mostrar barra         |

#### Paneles (panes)

| Teclas                      | Acción                           |
| --------------------------- | -------------------------------- |
| `SUPER` + `Shift` + `h`     | Panel horizontal (apilado)       |
| `SUPER` + `Shift` + `v`     | Panel vertical (lado a lado)     |
| `SUPER` + `Enter`           | Maximizar/restaurar panel        |
| `SUPER` + `w`               | Cerrar panel                     |
| `SUPER_REV` + `h`/`j`/`k`/`l` | Navegar entre panes (vim-style) |
| `SUPER_REV` + `p`           | Intercambiar panel               |
| `SUPER` + `u` / `d`         | Desplazar 5 líneas               |
| `SUPER` + `Shift` + `u` / `d` | Desplazar página               |

#### Ventanas

| Teclas              | Acción                    |
| ------------------- | ------------------------- |
| `SUPER` + `n`       | Nueva ventana             |
| `SUPER_REV` + `s`   | Reducir tamaño (-50px)    |
| `SUPER_REV` + `e`   | Aumentar tamaño (+50px)   |
| `SUPER_REV` + `Enter` | Maximizar ventana        |

#### Acciones LEADER (una tecla)

Presiona `LEADER` (`Cmd`+`Ctrl`+`a`) y luego:

| Tecla       | Acción                     |
| ----------- | -------------------------- |
| `c`         | Modo copia                 |
| `,`         | Paleta de comandos         |
| `Space`     | Lanzador                   |
| `Enter`     | Pantalla completa          |
| `d`         | Superposición de depuración |
| `v`         | Panel vertical             |
| `h`         | Panel horizontal           |
| `b`         | Ocultar/mostrar barra      |

#### Modos persistentes (LEADER + tecla)

| Tecla | Modo           |
| ----- | -------------- |
| `f`   | `resize_font`  |
| `p`   | `resize_pane`  |

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
