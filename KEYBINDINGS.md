# WezTerm — Atajos de teclado

Configuración optimizada para **teclado 60% ISO español**, portable entre **macOS / Windows / Linux**.

## Convenciones de modificadores

| Símbolo | macOS | Windows / Linux |
|---|---|---|
| `SUP` | `CMD` | `ALT` |
| `SUP+REV` | `CMD + CTRL` | `ALT + CTRL` |
| `LEADER` | `CMD + CTRL + a` | `ALT + CTRL + a` |

> **Por qué `ALT` en vez de `WIN` en Windows:** evita conflictos con los atajos de sistema de Windows.
>
> **Por qué no F1–F12:** en teclados 60% requieren `Fn`; en macOS todas conflictúan con el sistema (brillo, Mission Control, Spotlight, volumen). Reemplazadas por `LEADER + tecla`.
>
> **Por qué no flechas de dirección:** en teclados 60% requieren `Fn + W/A/S/D`. La navegación de paneles usa `h/j/k/l` al estilo vim.
>
> **Por qué no `PageUp`/`PageDown`:** no disponibles en teclados 60% sin `Fn`. Reemplazadas por `SUP + SHIFT + u/d`.
>
> **Por qué no `/` en fondos:** en teclado español `/` requiere `SHIFT+7`; WezTerm lo ve como tecla distinta. Los fondos usan letras directas (`r`, `b`).
>
> **Por qué letras en lugar de `=`, `-`, `0`:** en teclado español `=` requiere `SHIFT+0`; WezTerm ve el modificador SHIFT extra y el atajo no funciona. `k`, `j`, `r`, `e`, `s` son letras directas sin SHIFT en todos los layouts (US, español, etc.).
>
> **Splits con `v` y `h`:** `v` = divisor vertical (paneles lado a lado), `h` = divisor horizontal (paneles apilados).

---

## 1. Fuente

| Acción | macOS | Windows / Linux |
|---|---|---|
| Fuente más grande | `CMD + k` | `ALT + k` |
| Fuente más pequeña | `CMD + j` | `ALT + j` |
| Fuente reset | `CMD + r` | `ALT + r` |

> Las teclas `k`/`j`/`r` coinciden con el **modo resize_font** (`LEADER + f`), donde también `k`=↑, `j`=↓, `r`=reset. Para ajustes repetitivos usa ese modo (no necesitas mantener modificadores).

---

## 2. Copiar / Pegar / Mouse

| Acción | Todos los SO |
|---|---|
| Copiar | `CTRL + SHIFT + c` |
| Pegar | `CTRL + SHIFT + v` |
| Abrir enlace | `CTRL + clic izquierdo` |

---

## 3. Terminal

| Acción | macOS | Windows / Linux |
|---|---|---|
| Buscar en terminal | `CMD + f` | `ALT + f` |
| Abrir URL seleccionada | `CMD + CTRL + u` | `ALT + CTRL + u` |
| Borrar línea (CTRL+U) | `CMD + ⌫` | `ALT + ⌫` |

---

## 4. Pestañas

| Acción | macOS | Windows / Linux |
|---|---|---|
| Nueva pestaña | `CMD + t` | `ALT + t` |
| Nueva pestaña WSL | `CMD + CTRL + t` | `ALT + CTRL + t` *(solo Windows)* |
| Cerrar pestaña | `CMD + CTRL + w` | `ALT + CTRL + w` |
| Pestaña anterior | `CMD + [` | `ALT + [` |
| Pestaña siguiente | `CMD + ]` | `ALT + ]` |
| Mover pestaña ← | `CMD + CTRL + [` | `ALT + CTRL + [` |
| Mover pestaña → | `CMD + CTRL + ]` | `ALT + CTRL + ]` |
| Renombrar pestaña | `LEADER + r` | `LEADER + r` |
| Resetear nombre | `CMD + CTRL + 0` o `LEADER + R` | `ALT + CTRL + 0` o `LEADER + R` |
| Mostrar/ocultar tab bar | `CMD + 9` o `LEADER + b` | `ALT + 9` o `LEADER + b` |

---

## 5. Ventanas

| Acción | macOS | Windows / Linux |
|---|---|---|
| Nueva ventana | `CMD + n` | `ALT + n` |
| Maximizar | `CMD + CTRL + Enter` | `ALT + CTRL + Enter` |
| Encoger ventana (−50px) | `CMD + CTRL + s` | `ALT + CTRL + s` |
| Agrandar ventana (+50px) | `CMD + CTRL + e` | `ALT + CTRL + e` |

---

## 6. Fondos de pantalla

| Acción | macOS | Windows / Linux |
|---|---|---|
| Fondo aleatorio | `CMD + CTRL + r` | `ALT + CTRL + r` |
| Fondo anterior | `CMD + ,` | `ALT + ,` |
| Fondo siguiente | `CMD + .` | `ALT + .` |
| Seleccionar (lista fuzzy) | `CMD + CTRL + b` | `ALT + CTRL + b` |
| Activar / desactivar fondo | `CMD + b` | `ALT + b` |

> Las teclas `,` `.` `r` `b` son directamente accesibles en teclado español sin necesidad de `SHIFT`.

---

## 7. Paneles — dividir

Hay **dos formas** de dividir. Usar `LEADER` dentro de **opencode** (que intercepta `CMD/ALT + SHIFT + h/v`).

| Acción | Directo | Vía LEADER |
|---|---|---|
| Split apilado (÷ horizontal) | `CMD + SHIFT + h` / `ALT + SHIFT + h` | `LEADER + h` |
| Split lado a lado (÷ vertical) | `CMD + SHIFT + v` / `ALT + SHIFT + v` | `LEADER + v` |

---

## 8. Paneles — navegar / zoom / cerrar

| Acción | macOS | Windows / Linux |
|---|---|---|
| Panel superior | `CMD + CTRL + k` | `ALT + CTRL + k` |
| Panel inferior | `CMD + CTRL + j` | `ALT + CTRL + j` |
| Panel izquierdo | `CMD + CTRL + h` | `ALT + CTRL + h` |
| Panel derecho | `CMD + CTRL + l` | `ALT + CTRL + l` |
| Seleccionar / intercambiar panel | `CMD + CTRL + p` | `ALT + CTRL + p` |
| Zoom panel (toggle) | `CMD + Enter` | `ALT + Enter` |
| Cerrar panel | `CMD + w` | `ALT + w` |

---

## 9. Scroll

| Acción | macOS | Windows / Linux |
|---|---|---|
| Subir 5 líneas | `CMD + u` | `ALT + u` |
| Bajar 5 líneas | `CMD + d` | `ALT + d` |
| Página arriba | `CMD + SHIFT + u` | `ALT + SHIFT + u` |
| Página abajo | `CMD + SHIFT + d` | `ALT + SHIFT + d` |

---

## 10. LEADER — atajos directos

**Activar LEADER:** `CMD + CTRL + a` (Mac) / `ALT + CTRL + a` (Win-Linux)
→ suelta → pulsa la tecla de acción (tienes **3 segundos**).

El indicador aparece en la barra izquierda mientras LEADER está activo.

| Tecla tras LEADER | Acción | Sustituye a |
|---|---|---|
| `v` | Split lado a lado *(funciona en opencode)* | `CMD/ALT + SHIFT + v` |
| `h` | Split apilado *(funciona en opencode)* | `CMD/ALT + SHIFT + h` |
| `r` | Renombrar pestaña (prompt) | antiguo `CMD + 0` |
| `R` | Resetear nombre pestaña | `CMD + CTRL + 0` *(alias)* |
| `b` | Mostrar / ocultar tab bar | `CMD + 9` *(alias)* |
| `c` | Modo copia (CopyMode, estilo vim) | `F1` |
| `,` | Paleta de comandos WezTerm | `F2` |
| `Space` | Lanzador (tabs, workspaces, dominios) | `F3` / `F4` / `F5` |
| `Enter` | Pantalla completa (toggle) | `F11` |
| `d` | Debug overlay | `F12` |

---

## 11. LEADER — modos persistentes

Estos modos se mantienen activos **indefinidamente** hasta que pulses `Esc` o `q`. No hay timeout de inactividad.

### Cómo usarlos

```
1. CMD+CTRL+a          → activa LEADER (indicador en barra izquierda)
2. f  (o p)            → entra al modo
3. pulsa k/j/h/l...    → ajusta (puedes repetir todas las veces que quieras)
4. Esc o q             → sale del modo
```

### Modo resize fuente (`LEADER` → `f`)

El indicador cambia a `RESIZE_FONT` mientras está activo.

| Tecla | Acción |
|---|---|
| `k` | Fuente más grande |
| `j` | Fuente más pequeña |
| `r` | Resetear tamaño de fuente |
| `Esc` / `q` | Salir del modo |

### Modo resize panel (`LEADER` → `p`)

El indicador cambia a `RESIZE_PANE` mientras está activo.

| Tecla | Acción |
|---|---|
| `k` | Agrandar panel hacia arriba |
| `j` | Agrandar panel hacia abajo |
| `h` | Agrandar panel hacia la izquierda |
| `l` | Agrandar panel hacia la derecha |
| `Esc` / `q` | Salir del modo |

---

## Notas técnicas

- `disable_default_key_bindings = true` — solo existen los atajos de este documento.
- Los atajos son **idénticos en los 3 SO**; solo cambia el nombre de la tecla (`CMD` / `ALT`).
- **Dentro de opencode:** usar siempre `LEADER + v/h` para dividir paneles.
- **Windows con teclado español:** `ALT + CTRL` = `AltGr`; verificar combinaciones con `[`, `]` y `0` si producen caracteres especiales. Alternativas via LEADER disponibles para los casos conflictivos.
- WezTerm recarga la config automáticamente al guardar.
- Archivo de configuración: `~/.config/wezterm/config/bindings.lua`.
