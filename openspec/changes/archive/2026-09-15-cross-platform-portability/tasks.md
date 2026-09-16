## 1. Desacoplamiento de Entornos y Rutas Hardcodeadas

- [x] 1.1 Limpiar `config/domains.lua` eliminando el usuario `kevin` y configurando dominios WSL genéricos sin credenciales estáticas; verificar con luacheck que no haya variables no definidas.
- [x] 1.2 Limpiar `config/launch.lua` eliminando rutas de usuario fijas en Windows (ej. Scoop) y estandarizando invocaciones de shells en PATH (`pwsh`, `powershell`, `cmd`, `bash`); verificar con luacheck.

## 2. Reingeniería de Keybindings en `config/bindings.lua`

- [x] 2.1 Definir el nuevo esquema de modificadores semánticos (`mod.PRIMARY = 'CTRL|SHIFT'` en Linux/Windows y `'SUPER'` en macOS; `mod.TAB_NUM = 'ALT'` en Linux/Windows y `'SUPER'` en macOS).
- [x] 2.2 Configurar `leader = { key = 'a', mods = 'CTRL' }` y agregar la acción para enviar `Ctrl+a` literal a la shell al presionar `a` con Leader.
- [x] 2.3 Reemplazar atajos con símbolos (`\`, `]`, `[`, etc.) por combinaciones alfanuméricas (`PRIMARY + d` split horizontal, `PRIMARY + e` split vertical, `PRIMARY + x` cerrar panel, `PRIMARY + Enter` zoom).
- [x] 2.4 Implementar navegación de pestañas con `CTRL + Tab`, `CTRL + SHIFT + Tab` y acceso numérico directo (`TAB_NUM + 1` .. `TAB_NUM + 8`).
- [x] 2.5 Reasignar atajos de fondos/backdrops a combinaciones con Leader (`Leader + b`, `Leader + n`, `Leader + p`, `Leader + s`) eliminando dependencias de `,`, `.`, `/`.
- [x] 2.6 Eliminar secuencias de escape no portables de Mac (`\u{1b}OH`, `\u{1b}OF`, `\u{15}`) mapeadas a `ALT` en Linux/Windows.

## 3. Formateo y Verificación de Código

- [x] 3.1 Formatear el repositorio ejecutando `npx @johnnymorganz/stylua-bin -g '!/config/init.lua' wezterm.lua colors/ config/ events/ utils/` y comprobar formato limpio.
- [x] 3.2 Ejecutar `luacheck wezterm.lua colors/* config/* events/* utils/*` y verificar cero advertencias/errores de análisis estático.

## 4. Documentación y Guía de Verificación Manual

- [x] 4.1 Actualizar y simplificar `README.md` con las nuevas tablas de atajos usando nombres literales de teclas (`Ctrl`, `Shift`, `Alt`, `Super/Cmd`, teclas de función) sin abreviaciones ambiguas.
- [x] 4.2 Agregar en `README.md` una sección de Guía de Verificación Manual paso a paso para comprobar tabs, splits, leader y shells en macOS, Linux y Windows.

## 5. Correcciones de Atajos, Redimensión y Reubicación

- [x] 5.1 Reconfigurar el redimensionamiento de paneles (`resize_pane`) con timeout de 2500 ms, paso de 3 celdas y soporte para flechas de cursor (`LeftArrow`, `RightArrow`, `UpArrow`, `DownArrow`) además de `h`, `j`, `k`, `l`.
- [x] 5.2 Mapear la reubicación/intercambio de paneles (swap) con `Leader + w` llamando a `act.PaneSelect({ mode = 'SwapWithActiveKeepFocus', alphabet = '1234567890' })`.
- [x] 5.3 Mapear la reubicación de pestañas con `CTRL + SHIFT + PageUp` y `CTRL + SHIFT + PageDown` llamando a `act.MoveTabRelative(-1)` y `act.MoveTabRelative(1)`.
- [x] 5.4 Reasignar los atajos de gestión de pestañas a combinaciones con Leader y teclas de función (`Leader + t` para renombrar, `Leader + T` para resetear nombre, `F9` y `Leader + z` para alternar barra de pestañas).
- [x] 5.5 Formatear con StyLua, verificar con WezTerm CLI y actualizar tablas y guía de verificación en `README.md`.
