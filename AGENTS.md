# AGENTS.md

Repositorio de configuración de WezTerm escrito en Lua, modularizado en `colors/`, `config/`, `events/` y `utils/`.

## Arquitectura y Puntos de Entrada

- **`wezterm.lua`**: Punto de entrada principal de la configuración. Escanea los fondos de pantalla (backdrops), registra los manejadores de eventos y combina las tablas de los módulos en una única tabla de configuración mediante `Config:init():append(...)`.
- **`config/init.lua`**: Implementa el patrón builder para `Config`. Se encarga de la combinación modular y emite advertencias ante claves duplicadas.
  - StyLua lo ignora al formatear (`-g '!/config/init.lua'`) debido a la sintaxis de etiquetas y `goto continue` de Lua (`::continue::`).
- **`config/*.lua`**: Submódulos que retornan tablas de opciones de configuración (`appearance`, `bindings`, `domains`, `fonts`, `general`, `launch`).
- **`events/*.lua`**: Configuraciones de eventos vinculadas a los callbacks de WezTerm (`gui-startup`, `tab-title`, `left-status`, `right-status`, `new-tab-button`). Sus métodos `.setup()` se invocan en `wezterm.lua`.
- **`utils/*.lua`**: Módulos de utilidad (`backdrops.lua`, `gpu-adapter.lua`, `platform.lua`, `cells.lua`, `str.lua`, etc.).
- **`backdrops/`**: Directorio con imágenes de fondo cargadas mediante `utils.backdrops`.

## Linting y Formateo

El flujo de CI valida el formato con StyLua y el análisis estático con Luacheck (`.github/workflows/lint.yml`).

- **Comprobar formato**:
  ```bash
  npx @johnnymorganz/stylua-bin -g '!/config/init.lua' --check wezterm.lua colors/ config/ events/ utils/
  ```
- **Autoformatear archivos**:
  ```bash
  npx @johnnymorganz/stylua-bin -g '!/config/init.lua' wezterm.lua colors/ config/ events/ utils/
  ```
- **Lint (luacheck)**:
  ```bash
  luacheck wezterm.lua colors/* config/* events/* utils/*
  ```
  *(La configuración se define en `.luacheckrc`: estándar `luajit`, longitud de línea 150).*

## Convenciones de Código y Consideraciones

- **Configuración de StyLua (`.stylua.toml`)**: Ancho de indentación de 3 espacios (espacios, no tabuladores). `column_width = 100`, `quote_style = "AutoPreferSingle"`.
- **Convenciones de modificadores (`config/bindings.lua`)**:
  - `SUPER` equivale a `SUPER` en macOS, pero a `ALT` en Linux/Windows para prevenir colisiones con atajos del sistema operativo.
  - `SUPER_REV` equivale a `SUPER|CTRL` en macOS, y a `ALT|CTRL` en Linux/Windows.
- **Fusión de configuraciones**: Al agregar una nueva propiedad, evita claves duplicadas entre los submódulos de `config/*.lua`, ya que `Config:append()` genera una advertencia y omite sobreescribir las claves existentes.
- **Backdrops**: `utils.backdrops` usa `./backdrops` dentro de la raíz de configuración por defecto, a menos que se redirija con `:set_images_dir(...)`.
