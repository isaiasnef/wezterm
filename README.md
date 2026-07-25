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
| `SUPER` + `0`       | Renombrar pestaña             |
| `SUPER_REV` + `0`   | Restaurar título              |
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
| `r`         | Renombrar pestaña          |
| `R`         | Restaurar título           |
| `b`         | Ocultar/mostrar barra      |

#### Modos persistentes (LEADER + tecla)

| Tecla | Modo           |
| ----- | -------------- |
| `f`   | `resize_font`  |
| `p`   | `resize_pane`  |

Dentro del modo, usa `k`/`j` (fuente) o `h`/`j`/`k`/`l` (paneles).  
`Esc` o `q` para salir.

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

1. Clona el repositorio:
   ```sh
   git clone https://github.com/isaiasnef/wezterm.git ~/.config/wezterm
   ```

2. **(Opcional)** Ajusta las rutas de shell en `config/launch.lua` según tu sistema.

3. **(Opcional)** Ajusta los dominios en `config/domains.lua`.

4. ¡Listo! 🎉

**Requisitos:**
- WezTerm `20240127-113634-bbcac864` o superior
- [JetBrainsMono Nerd Font](https://www.nerdfonts.com/) (instalar con `brew install --cask font-jetbrains-mono-nerd-font` en macOS)

---

### Referencias

- <https://github.com/wez/wezterm>
- <https://github.com/KevinSilvester/wezterm-config> — inspiración original
- <https://github.com/catppuccin/wezterm>
