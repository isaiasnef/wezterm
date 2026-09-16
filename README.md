# Configuración de WezTerm Multiplataforma

Configuración modular de [WezTerm](https://wezfurlong.org/wezterm/) optimizada para funcionar de forma transparente y sin ajustes manuales en **Linux**, **macOS** y **Windows (nativo o WSL)**.

---

## Características Principales

- **Atajos Portables y Tradicionales**: Sin conflictos con comandos de terminal o atajos del sistema operativo.
  - En **Linux / Windows**: `Ctrl + Shift` para operaciones de terminal y `Alt` simple libre para shells (`bash`, `zsh`, `fish`, readline).
  - En **macOS**: `Cmd (Super)` tradicional de macOS.
- **Independiente de la distribución de teclado**: Se eliminaron caracteres especiales (`\`, `[`, `]`, `/`, etc.) para garantizar compatibilidad con teclados en español, inglés o cualquier distribución ISO/ANSI.
- **Leader Key Ergonómico (`Ctrl + a`)**: Acceso rápido a tablas modales para redimensionar paneles, fuentes, intercambiar paneles y controlar fondos de pantalla.
- **Redimensión y Reubicación de Paneles**: Modo interactivo con ajuste visible de 3 celdas (flechas o `hjkl`) y selector visual para intercambiar posiciones de splits (`Swap`).
- **Reorganización de Pestañas**: Desplazamiento relativo de pestañas hacia la izquierda o derecha con `Ctrl + Shift + PageUp / PageDown`.
- **Selector de Fondos**: Cambio cíclico o búsqueda difusa de fondos de pantalla incluidos en `backdrops/`.
- **Detección Automática de Shells y WSL**: Sin rutas hardcodeadas ni nombres de usuario fijos.

---

## Requisitos e Instalación

1. **Instalar WezTerm**:
   - **Linux**: Ver instrucciones según distribución en [wezfurlong.org/wezterm/install/linux.html](https://wezfurlong.org/wezterm/install/linux.html).
   - **macOS**: `brew install --cask wezterm`
   - **Windows**: `winget install wez.wezterm` o `choco install wezterm -y`

2. **Tipografía recomendada**:
   - `JetBrainsMono Nerd Font` (o cualquier Nerd Font equivalente).

3. **Clonar este repositorio**:
   ```bash
   git clone https://github.com/KevinSilvester/wezterm-config.git ~/.config/wezterm
   ```

---

## Tabla Completa de Atajos de Teclado

### Convención de Teclas Modificadoras

| Modificador en esta guía | Linux / Windows | macOS |
| ------------------------ | --------------- | ----- |
| **Principal**            | `Ctrl + Shift`  | `Cmd` |
| **Principal + Secundario** | `Ctrl + Alt`  | `Cmd + Shift` |
| **Pestañas por Número**  | `Alt + [1-8]`   | `Cmd + [1-8]` |
| **Leader Key**           | `Ctrl + a`      | `Ctrl + a` |

---

### Pestañas (Tabs)

| Acción | Linux / Windows | macOS |
| ------ | --------------- | ----- |
| **Nueva pestaña** | `Ctrl + Shift + t` | `Cmd + t` |
| **Cerrar pestaña activa** | `Ctrl + Shift + w` | `Cmd + w` |
| **Pestaña siguiente** | `Ctrl + Tab` | `Ctrl + Tab` |
| **Pestaña anterior** | `Ctrl + Shift + Tab` | `Ctrl + Shift + Tab` |
| **Mover pestaña a la izquierda** | `Ctrl + Shift + PageUp` | `Ctrl + Shift + PageUp` |
| **Mover pestaña a la derecha** | `Ctrl + Shift + PageDown` | `Ctrl + Shift + PageDown` |
| **Ir a pestaña específica (1 al 8)** | `Alt + 1` .. `Alt + 8` | `Cmd + 1` .. `Cmd + 8` |
| **Ir a última pestaña** | `Alt + 9` | `Cmd + 9` |
| **Renombrar pestaña** | `Ctrl + a` seguido de `t` | `Ctrl + a` seguido de `t` |
| **Restablecer nombre de pestaña** | `Ctrl + a` seguido de `Shift + t` | `Ctrl + a` seguido de `Shift + t` |
| **Ocultar / Mostrar barra de pestañas** | `F9` o `Ctrl + a` seguido de `z` | `F9` o `Ctrl + a` seguido de `z` |

---

### Paneles (Panes)

| Acción | Linux / Windows | macOS |
| ------ | --------------- | ----- |
| **Dividir horizontalmente** | `Ctrl + Shift + d` | `Cmd + d` |
| **Dividir verticalmente** | `Ctrl + Shift + e` | `Cmd + e` |
| **Cerrar panel activo** | `Ctrl + Shift + x` | `Cmd + x` |
| **Maximizar / Restaurar panel (Zoom)** | `Ctrl + Shift + Enter` | `Cmd + Enter` |
| **Intercambiar / Reubicar panel (Swap)** | `Ctrl + a` seguido de `w` | `Ctrl + a` seguido de `w` |
| **Moverse al panel superior** | `Ctrl + Alt + k` | `Cmd + Shift + k` |
| **Moverse al panel inferior** | `Ctrl + Alt + j` | `Cmd + Shift + j` |
| **Moverse al panel izquierdo** | `Ctrl + Alt + h` | `Cmd + Shift + h` |
| **Moverse al panel derecho** | `Ctrl + Alt + l` | `Cmd + Shift + l` |

---

### Utilidades y Portapapeles

| Acción | Linux / Windows | macOS |
| ------ | --------------- | ----- |
| **Copiar al portapapeles** | `Ctrl + Shift + c` | `Cmd + c` o `Ctrl + Shift + c` |
| **Pegar desde el portapapeles** | `Ctrl + Shift + v` | `Cmd + v` o `Ctrl + Shift + v` |
| **Buscar texto** | `Ctrl + Shift + f` | `Cmd + f` |
| **Abrir enlaces/URLs en pantalla** | `Ctrl + Shift + u` | `Cmd + u` |
| **Paleta de comandos** | `F2` o `Ctrl + Shift + p` | `F2` o `Cmd + p` |
| **Modo copia (Copy Mode)** | `F1` | `F1` |
| **Lanzador de pestañas / dominios** | `F3` | `F3` |
| **Pantalla completa** | `F11` | `F11` |
| **Depuración (Debug Overlay)** | `F12` | `F12` |

---

### Atajos con Leader Key (`Ctrl + a`)

Presiona `Ctrl + a`, suelta ambas teclas y luego presiona la letra correspondiente:

| Tecla tras Leader | Acción |
| ----------------- | ------ |
| `a` | Envía `Ctrl + a` literal a la shell (ej. mover el cursor al inicio de la línea). |
| `r` | Entra al modo de **Redimensionar Paneles** (ajuste de 3 celdas con `Flechas` o `h`,`j`,`k`,`l`; timeout de 2.5s; sal con `Esc` o `q`). |
| `w` | Abre el selector visual (`PaneSelect`) para intercambiar la posición del panel activo con otro. |
| `t` | Abre diálogo para renombrar la pestaña activa manualmente. |
| `Shift + t` (`T`) | Restablece el nombre automático de la pestaña. |
| `z` | Oculta o muestra la barra de pestañas (equivalente a `F9`). |
| `f` | Entra al modo de **Tamaño de Fuente** (`k` aumenta, `j` reduce, `r` restablece; sal con `Esc` o `q`). |
| `b` | Alterna el enfoque/opacidad del fondo de pantalla. |
| `n` | Cambia al siguiente fondo de pantalla. |
| `p` | Cambia al fondo de pantalla anterior. |
| `s` | Abre el menú difuso de selección de fondos (`InputSelector`). |

---

## Guía de Verificación Manual

Para verificar rápidamente la correcta instalación y funcionamiento en cualquier equipo:

1. **Prueba de inicio**:
   - Inicia WezTerm. Verifica que no aparezcan alertas rojas de error de Lua al arrancar.
   - Presiona `F12` para abrir la consola de depuración y confirma que no haya excepciones reportadas.
2. **Prueba de Pestañas y Reubicación**:
   - Presiona `Ctrl + Shift + t` (en macOS `Cmd + t`) para abrir 2 o 3 pestañas adicionales.
   - Navega secuencialmente con `Ctrl + Tab` y `Ctrl + Shift + Tab`.
   - Navega directamente usando `Alt + 1`, `Alt + 2`, etc. (en macOS `Cmd + 1`, `Cmd + 2`).
   - Mueve una pestaña a la izquierda con `Ctrl + Shift + PageUp` y a la derecha con `Ctrl + Shift + PageDown`.
   - Renombra la pestaña con `Ctrl + a` y luego `t`. Escribe un nombre y presiona Enter.
   - Restablece el nombre automático presionando `Ctrl + a` y luego `Shift + t`.
   - Alterna la barra de pestañas presionando `F9` o `Ctrl + a` y luego `z`.
   - Cierra una pestaña con `Ctrl + Shift + w` (en macOS `Cmd + w`).
3. **Prueba de Paneles (Splits), Redimensión y Swap**:
   - Divide horizontalmente con `Ctrl + Shift + d` (en macOS `Cmd + d`).
   - Divide verticalmente con `Ctrl + Shift + e` (en macOS `Cmd + e`).
   - Presiona `Ctrl + a` y luego `r`: pulsa las `Flechas` o `h`, `j`, `k`, `l` para verificar el cambio de tamaño inmediato y visible (3 celdas). Sal con `Esc`.
   - Presiona `Ctrl + a` y luego `w`: aparecerán números sobre cada panel; presiona el número de otro panel para intercambiar sus posiciones de inmediato.
   - Maximiza y restaura el panel con `Ctrl + Shift + Enter` (en macOS `Cmd + Enter`).
   - Cierra el panel con `Ctrl + Shift + x` (en macOS `Cmd + x`).
4. **Prueba de Shell / Readline (Linux / Windows)**:
   - Escribe un comando largo en tu shell (ej. `echo palabra1 palabra2 palabra3`).
   - Presiona `Alt + b` y `Alt + f` para retroceder y avanzar entre palabras. Confirma que la shell responde y WezTerm no intercepta la tecla.
5. **Prueba de Leader Key (`Ctrl + a`)**:
   - Presiona `Ctrl + a` seguido de `a` en la shell: el cursor debe moverse al inicio de la línea.
   - Presiona `Ctrl + a` seguido de `n` o `s` para interactuar con los fondos de pantalla.
