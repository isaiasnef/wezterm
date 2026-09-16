## Purpose

Define el comportamiento esperado para la configuración de WezTerm asegurando portabilidad multiplataforma, ausencia de colisiones con shells o el sistema operativo, independencia del mapa de teclado físico (US/ES), redimensión/reubicación intuitiva de paneles y pestañas, y eliminación de acoplamientos a entornos locales específicos.

## ADDED Requirements

### Requirement: Esquema de modificadores adaptativo y sin colisiones
El sistema DEBE utilizar modificadores de terminal estándar (`CTRL+SHIFT`) en Linux y Windows, y preservar `SUPER` (CMD) en macOS para las operaciones de terminal (pestañas, paneles, búsqueda y portapapeles), manteniendo las combinaciones de `ALT` libre en Linux/Windows para las funciones nativas de la shell y readline.

#### Scenario: Uso de atajos de shell en Linux y Windows
- **WHEN** el usuario presiona `ALT+f`, `ALT+b` o `ALT+d` en un panel de terminal en Linux o Windows
- **THEN** WezTerm no intercepta la combinación y la transmite íntegra a la shell para navegación o edición de palabras en readline

#### Scenario: Gestión de pestañas y ventanas en Linux y Windows
- **WHEN** el usuario presiona `CTRL+SHIFT+t` o `CTRL+SHIFT+w`
- **THEN** WezTerm abre una nueva pestaña o cierra la pestaña activa respectivamente

#### Scenario: Gestión de pestañas y ventanas en macOS
- **WHEN** el usuario presiona `CMD+t` o `CMD+w` en macOS
- **THEN** WezTerm abre una nueva pestaña o cierra la pestaña activa respectivamente

---

### Requirement: Atajos independientes de la distribución de teclado (ANSI/ISO)
El sistema DEBE utilizar exclusivamente teclas alfanuméricas (`a-z`, `0-9`), teclas de función (`F1-F12`) y teclas de control estándar (`Tab`, `Enter`, `Escape`, `Space`, `PageUp`, `PageDown`) para todos los atajos, eliminando cualquier dependencia de caracteres especiales (`\`, `[`, `]`, `/`, `,`, `.`).

#### Scenario: División de paneles en cualquier layout de teclado
- **WHEN** el usuario presiona el atajo de split horizontal (`CTRL+SHIFT+d` o `CMD+d`) o vertical (`CTRL+SHIFT+e` o `CMD+e`) en un teclado en español o en inglés
- **THEN** WezTerm divide el panel sin requerir modificadores complejos de tercer nivel como AltGr

#### Scenario: Navegación de pestañas universal
- **WHEN** el usuario presiona `CTRL+Tab` o `CTRL+SHIFT+Tab`
- **THEN** WezTerm conmuta a la pestaña siguiente o anterior respectivamente en todas las plataformas

#### Scenario: Selección directa de pestañas por número
- **WHEN** el usuario presiona `ALT+1` a `ALT+8` (en Linux/Win) o `CMD+1` a `CMD+8` (en macOS)
- **THEN** WezTerm activa directamente la pestaña correspondiente al índice solicitado

---

### Requirement: Leader Key ergonómico con escape de carácter literal
El sistema DEBE configurar `CTRL+a` como Leader key global en todas las plataformas para funciones modales y permitir el envío del carácter `CTRL+a` (`\x01`) a la shell cuando se presiona dos veces consecutivas.

#### Scenario: Acceso a tabla de redimensión modal
- **WHEN** el usuario presiona `CTRL+a` seguido de `r`
- **THEN** WezTerm activa la tabla de teclas `resize_pane` para ajustar dimensiones con teclas de dirección hasta presionar `Escape` o expirar el tiempo

#### Scenario: Envío de Ctrl+A literal a la shell
- **WHEN** el usuario presiona `CTRL+a` seguido inmediatamente de `a`
- **THEN** WezTerm envía el código ASCII 1 (`\x01`) a la shell para mover el cursor al inicio de la línea

---

### Requirement: Redimensión perceptible y ergonómica de paneles
El sistema DEBE permitir redimensionar paneles con un timeout interactivo suficiente (mínimo 2500 ms renovable por pulsación), un paso de cambio visible (mínimo 3 celdas) y soporte para teclas direccionales estándar (`LeftArrow`, `RightArrow`, `UpArrow`, `DownArrow`) además de las teclas `h`, `j`, `k`, `l`.

#### Scenario: Ajuste de tamaño de panel con flechas direccionales
- **WHEN** el usuario activa el modo con `CTRL+a` y `r`, y presiona repetidamente `RightArrow` o `l`
- **THEN** el panel activo expande su ancho horizontal en incrementos de 3 celdas por pulsación sin cerrar el modo prematuramente

---

### Requirement: Reubicación e intercambio de paneles y pestañas
El sistema DEBE ofrecer atajos dedicados para reorganizar la disposición visual de paneles y pestañas sin depender de combinaciones con símbolos de teclado.

#### Scenario: Intercambio interactivo de paneles (Swap)
- **WHEN** el usuario presiona `CTRL+a` seguido de `w`
- **THEN** WezTerm entra en modo `PaneSelect` con modo de intercambio activo para intercambiar la posición del panel seleccionado con el actual

#### Scenario: Reubicación de pestañas hacia la izquierda y derecha
- **WHEN** el usuario presiona `CTRL+SHIFT+PageUp` o `CTRL+SHIFT+PageDown`
- **THEN** WezTerm desplaza la pestaña activa una posición hacia la izquierda o hacia la derecha respectivamente

---

### Requirement: Gestión de título y visibilidad de barra de pestañas sin colisiones numéricas
El sistema DEBE permitir renombrar la pestaña, restablecer el título automático y alternar la visibilidad de la barra de pestañas usando combinaciones de letras con Leader o teclas de función dedicadas, evitando colisiones con caracteres superiores (`=`, `)`) en teclados ISO.

#### Scenario: Renombrar pestaña manualmente
- **WHEN** el usuario presiona `CTRL+a` seguido de `t`
- **THEN** WezTerm muestra el diálogo de entrada para definir el nuevo nombre de la pestaña

#### Scenario: Restablecer el título automático de la pestaña
- **WHEN** el usuario presiona `CTRL+a` seguido de `T` (Shift+t)
- **THEN** WezTerm desbloquea el título manual y actualiza la pestaña al nombre del proceso en ejecución

#### Scenario: Alternar la barra de pestañas
- **WHEN** el usuario presiona `F9` o `CTRL+a` seguido de `z`
- **THEN** WezTerm conmuta la visibilidad de la barra de pestañas

---

### Requirement: Desacoplamiento de usuarios y programas locales
El sistema DEBE inicializarse sin errores en cualquier máquina sin requerir rutas absolutas específicas de un usuario (`kevin`), perfiles de WSL estáticos inexistentes o dependencias fijas de gestores de paquetes como Scoop.

#### Scenario: Inicio en sistema Linux o Windows estándar
- **WHEN** WezTerm arranca en un entorno donde el usuario no se llama `kevin` ni existen las rutas de WSL de desarrollo previo
- **THEN** la configuración carga limpiamente sin errores Lua ni advertencias en el overlay de depuración

#### Scenario: Detección de shells disponibles
- **WHEN** el menú de lanzamiento (`launch_menu`) o el programa predeterminado se inicializa
- **THEN** WezTerm ofrece opciones detectadas o genéricas (`pwsh`, `powershell`, `cmd` en Windows; `bash`, `zsh`, `fish` en Linux/macOS) sin apuntar a ejecutables con rutas de carpetas de usuario no existentes
