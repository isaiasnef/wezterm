## Context

Ver `proposal.md` y `specs/cross-platform-portability/spec.md`.

La configuración está dividida modularmente (`config/`, `events/`, `utils/`), combinada mediante `Config:append()` en `wezterm.lua`.
La verificación manual identificó:
1. `0` y `9` combinados con `mod.PRIMARY` (`CTRL|SHIFT`) fallan en teclados ISO/español porque requieren Shift para teclear los dígitos o generan caracteres como `=` y `)`.
2. El modo `resize_pane` tenía un timeout demasiado corto (1000 ms) y un paso de 1 sola celda (`amount = 1`), haciéndolo imperceptible y propenso a salirse antes de poder ajustar los paneles, careciendo además de mapeo de teclas de flechas.
3. Faltaban los atajos para reubicar paneles (swap) y mover pestañas relativas.

## Goals / Non-Goals

**Goals:**
- Sustituir atajos basados en `0` y `9` por atajos alfanuméricos con Leader (`Leader + t`, `Leader + T`, `Leader + z`) y tecla `F9`.
- Corregir el redimensionamiento de paneles aumentando el timeout a 2500 ms, paso de 3 celdas e incorporando flechas direccionales (`LeftArrow`, `RightArrow`, `UpArrow`, `DownArrow`).
- Implementar reubicación de paneles mediante `act.PaneSelect({ mode = 'SwapWithActiveKeepFocus' })` en `Leader + w`.
- Implementar reubicación de pestañas mediante `act.MoveTabRelative(-1 / 1)` en `CTRL + SHIFT + PageUp` y `CTRL + SHIFT + PageDown`.
- Mantener compatibilidad total con StyLua (`indent_width = 3`) y validación de sintaxis WezTerm.

**Non-Goals:**
- No se implementarán scripts externos de shell ni multiplexores tipo tmux adicionales.

## Decisions

### 1. Modelo de Modificadores Semánticos
En `config/bindings.lua`:
```lua
local mod = {}
if platform.is_mac then
   mod.PRIMARY = 'SUPER'
   mod.PRIMARY_REV = 'SUPER|SHIFT'
   mod.TAB_NUM = 'SUPER'
elseif platform.is_win or platform.is_linux then
   mod.PRIMARY = 'CTRL|SHIFT'
   mod.PRIMARY_REV = 'CTRL|ALT'
   mod.TAB_NUM = 'ALT'
end
```

### 2. Atajos de Pestañas y Paneles
- **Splits**:
  - Horizontal: `PRIMARY + d`
  - Vertical: `PRIMARY + e`
  - Cerrar panel: `PRIMARY + x`
  - Zoom / Toggle Maximizar panel: `PRIMARY + Enter`
- **Reubicación de Paneles (Swap)**:
  - `Leader + w`: `act.PaneSelect({ mode = 'SwapWithActiveKeepFocus', alphabet = '1234567890' })`
- **Navegación y Reubicación de Pestañas**:
  - Nueva / Cerrar: `PRIMARY + t` / `PRIMARY + w`
  - Siguiente / Anterior: `CTRL + Tab` / `CTRL + SHIFT + Tab`
  - Mover pestaña Izquierda / Derecha: `CTRL + SHIFT + PageUp` / `CTRL + SHIFT + PageDown`
  - Por número directo: `TAB_NUM + 1` .. `TAB_NUM + 8`, y `TAB_NUM + 9` para última pestaña.
- **Gestión de Título y Barra de Pestañas**:
  - `Leader + t`: Renombrar pestaña (`tabs.manual-update-tab-title`)
  - `Leader + T` (`Shift+t`): Resetear nombre de pestaña (`tabs.reset-tab-title`)
  - `F9` y `Leader + z`: Alternar barra de pestañas (`tabs.toggle-tab-bar`)

### 3. Redimensión de Paneles Funcional
En `key_tables.resize_pane`:
- `timeout_milliseconds = 2500`
- `amount = 3` por pulsación
- Soporte dual: `h`, `j`, `k`, `l` y `LeftArrow`, `RightArrow`, `UpArrow`, `DownArrow`.

### 4. Leader Key: `CTRL+a`
- `leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }`
- Atajo `{ key = 'a', mods = 'LEADER', action = act.SendString('\u{01}') }` para enviar `Ctrl+A` literal al shell.

## Risks / Trade-offs

- **[Riesgo] Interacción de `PageUp`/`PageDown` en aplicaciones ncurses**:
  → *Mitigación*: `CTRL+SHIFT+PageUp`/`Down` es una combinación estándar de emulador de terminal que no interfiere con el scroll convencional de aplicaciones de consola.
