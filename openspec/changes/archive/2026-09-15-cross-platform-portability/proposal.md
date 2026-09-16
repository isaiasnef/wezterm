## Why

La configuración actual de WezTerm está fuertemente acoplada a macOS y a un entorno de usuario específico (`kevin` en WSL). En Linux y Windows, el mapeo de teclas (`SUPER -> ALT`) genera graves colisiones con los atajos nativos de shells (`bash`, `zsh`, `fish`), readline y sistemas de ventanas. Además, los atajos dependen de símbolos específicos de teclados en inglés (`\`, `[`, `]`, `/`, `,`, `.`) que fallan o son inaccesibles en teclados en español/internacionales, y existen rutas y programas hardcodeados que rompen la portabilidad.

Adicionalmente, la verificación manual demostró que los atajos mapeados con combinaciones de números (`0` y `9`) colisionan en teclados ISO/español con caracteres superiores (`=`, `)`) impidiendo renombrar o alternar la barra de pestañas, el modo de redimensión de paneles actual es inoperante por tener un timeout excesivamente corto (1000 ms) y una sensibilidad imperceptible (1 sola celda) sin soporte de flechas, y faltan los atajos esenciales para reubicación de paneles (swap) y de pestañas (move tab).

Esta reingeniería estandariza los atajos usando teclas alfanuméricas y funciones, adopta un esquema tradicional multiplataforma (`CTRL+SHIFT` en Linux/Windows, `CMD` en macOS y Leader `CTRL+a`), desacopla rutas y configuraciones fijas, dota de redimensión y reubicación ergonómica de paneles y pestañas, y simplifica la documentación para garantizar una experiencia funcional y reproducible sin ajustes manuales.

## What Changes

- **Portabilidad de atajos (Esquema Tradicional)**:
  - En Linux y Windows se sustituye `ALT` como modificador principal por `CTRL+SHIFT` para funciones de terminal estándar (tabs, splits, búsqueda, portapapeles).
  - En macOS se preserva `SUPER` (CMD).
  - Se libera la tecla `ALT` simple en Linux/Windows para preservar intactas las funciones de readline/shell (`ALT+f`, `ALT+b`, `ALT+d`, etc.).
- **Diseño de atajos agnóstico de distribución de teclado**:
  - Reemplazo de caracteres especiales (`\`, `]`, `[`, `/`, etc.) por combinaciones alfanuméricas y teclas de función (`e`, `d`, `x`, `t`, `w`, `p`, `f`, `b`, `n`, `F1`-`F12`).
  - Navegación de pestañas estándar con `CTRL+Tab` / `CTRL+SHIFT+Tab` y acceso numérico directo (`ALT+1`..`ALT+8` o `CMD+1`..`CMD+8`).
- **Leader Key Unificado (`CTRL+a`) y Funcionalidades Avanzadas**:
  - Se sustituye el incómodo `SUPER_REV + Space` por `CTRL+a`.
  - Envío transparente de `CTRL+a` literal a la terminal presionando `a` dos veces.
  - **Redimensión de paneles funcional**: timeout de 2500 ms con step visible de 3 celdas y soporte tanto para `h/j/k/l` como flechas direccionales.
  - **Reubicación interactiva de paneles (Swap)**: `Leader + w` activa `act.PaneSelect({ mode = 'SwapWithActiveKeepFocus' })`.
  - **Reubicación de pestañas**: `CTRL + SHIFT + PageUp` y `CTRL + SHIFT + PageDown` para mover la pestaña relativa a izquierda o derecha.
  - **Gestión de pestañas mediante Leader**: `Leader + t` para renombrar pestaña, `Leader + T` (Shift+t) para restablecer nombre y `Leader + z` o `F9` para alternar la barra de pestañas.
- **Desacoplamiento de entorno de usuario y rutas fijas**:
  - Eliminación de referencias a `kevin`, rutas fijas de Scoop en Windows y dominios WSL estáticos.
  - Detección dinámica del usuario (`wezterm.home_dir`, `USER`, `USERNAME`) y fallback a shells estándar existentes en el sistema.
- **Documentación y Guías**:
  - Reescribir y simplificar `README.md` en español/inglés claro, con tablas de atajos que muestren las teclas literales sin abreviaciones crípticas.
  - Proveer una guía de verificación manual paso a paso para macOS, Linux y Windows.

## Capabilities

### New Capabilities
- `cross-platform-portability`: Especificación de comportamiento portable para atajos de teclado sin colisiones, agnóstico al layout de teclado (US/ES), desacoplamiento de dominios/shells, redimensión/reubicación ergonómica de paneles y pestañas, y paridad de experiencia entre macOS, Linux y Windows.

### Modified Capabilities
<!-- No existing capabilities to modify in openspec/specs/ -->

## Impact

- `config/bindings.lua`: Reestructuración completa de modificadores, teclas de atajo, Leader key, redimensión de paneles robusta, swap de paneles y movimiento de pestañas.
- `events/tab-title.lua`: Asegurar la activación correcta de eventos de título y barra de pestañas.
- `config/domains.lua`: Eliminación de usuario hardcodeado `kevin` y dominios WSL fijos; detección condicional y dinámica.
- `config/launch.lua`: Sustitución de rutas absolutas hardcodeadas por ejecutables universales y detección de shells instaladas.
- `README.md`: Actualización integral de tablas de atajos, documentación de Leader y guía de verificación manual.
- Formato y Lint: Requiere cumplir con StyLua (`indent_width = 3`, `!config/init.lua`) y validación de carga con WezTerm.
