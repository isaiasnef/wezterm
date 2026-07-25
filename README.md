# WezTerm Configuration

Configuración de [WezTerm](https://wezfurlong.org/wezterm/) para **Linux**, **Mac** y **Windows**.

## Características

- 🖥️ Compatible con Linux, macOS y Windows
- 🎨 Esquema de colores **Catppuccin Mocha**
- 🔤 Fuentes con ligaduras (JetBrains Mono, Fira Code, Cascadia Code, Consolas)
- ⌨️ Atajos de teclado para manejo de pestañas y paneles
- 🪟 Configuración de ventana con transparencia
- 🐚 Shell predeterminado según el sistema operativo

## Estructura

```
wezterm.lua          ← Punto de entrada principal
config/
  appearance.lua     ← Fuente, colores, ventana y barra de pestañas
  keybindings.lua    ← Atajos de teclado y ratón
  platform.lua       ← Configuración específica por sistema operativo
```

## Instalación

### Linux

```bash
# Clonar el repositorio en el directorio de configuración de WezTerm
git clone https://github.com/isaiasnef/wezterm.git ~/.config/wezterm
```

### macOS

```bash
# Clonar el repositorio en el directorio de configuración de WezTerm
git clone https://github.com/isaiasnef/wezterm.git ~/.config/wezterm
```

### Windows

```powershell
# Clonar el repositorio en el directorio de configuración de WezTerm
git clone https://github.com/isaiasnef/wezterm.git "$env:USERPROFILE\.config\wezterm"
```

> **Nota:** WezTerm también busca la configuración en `%USERPROFILE%\.wezterm.lua`
> o en `%USERPROFILE%\AppData\Roaming\wezterm\wezterm.lua` en Windows.

## Fuentes recomendadas

Para aprovechar las ligaduras, instala al menos una de estas fuentes:

| Fuente | Enlace |
|--------|--------|
| JetBrains Mono | <https://www.jetbrains.com/lp/mono/> |
| Fira Code | <https://github.com/tonsky/FiraCode> |
| Cascadia Code | <https://github.com/microsoft/cascadia-code> |

## Atajos de teclado

| Acción | Atajo |
|--------|-------|
| Nueva pestaña | `Ctrl+Shift+T` |
| Cerrar pestaña | `Ctrl+Shift+W` |
| Pestaña siguiente | `Ctrl+Tab` |
| Pestaña anterior | `Ctrl+Shift+Tab` |
| Ir a pestaña N | `Ctrl+1` … `Ctrl+9` |
| Dividir panel horizontal | `Ctrl+Shift+Alt+H` |
| Dividir panel vertical | `Ctrl+Shift+Alt+V` |
| Navegar paneles | `Ctrl+Shift+↑↓←→` |
| Cerrar panel | `Ctrl+Shift+X` |
| Zoom panel | `Ctrl+Shift+Z` |
| Copiar | `Ctrl+Shift+C` |
| Pegar | `Ctrl+Shift+V` |
| Aumentar fuente | `Ctrl+=` |
| Reducir fuente | `Ctrl+-` |
| Fuente original | `Ctrl+0` |
| Buscar | `Ctrl+Shift+F` |
| Pantalla completa | `F11` |
| Recargar configuración | `Ctrl+Shift+R` |
