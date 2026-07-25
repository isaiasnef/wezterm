-- config/platform.lua
-- Platform detection and platform-specific settings for Linux, Mac and Windows

local wezterm = require 'wezterm'

local M = {}

-- Detect the current operating system
function M.detect()
    local target = wezterm.target_triple
    if target:find('windows') then
        return 'windows'
    elseif target:find('darwin') then
        return 'mac'
    else
        return 'linux'
    end
end

-- Apply platform-specific configuration
function M.apply(config)
    local os = M.detect()

    if os == 'windows' then
        -- Windows: use PowerShell as the default shell
        config.default_prog = { 'pwsh.exe', '-NoLogo' }

        -- On Windows, adjust font size slightly
        config.font_size = 11.0

        -- Windows: use native window decorations
        config.window_decorations = 'TITLE | RESIZE'

        -- Enable WSL integration
        config.wsl_domains = wezterm.default_wsl_domains()

    elseif os == 'mac' then
        -- macOS: use zsh as the default shell
        config.default_prog = { '/bin/zsh', '-l' }

        -- macOS: larger font to match Retina displays
        config.font_size = 13.0

        -- macOS: use native window decorations
        config.window_decorations = 'RESIZE | MACOS_FORCE_ENABLE_SHADOW'

        -- macOS: option key as meta
        config.send_composed_key_when_left_option_is_pressed = false
        config.send_composed_key_when_right_option_is_pressed = false

    else
        -- Linux: use bash as default shell
        config.default_prog = { '/bin/bash', '-l' }

        -- Linux: standard font size
        config.font_size = 12.0

        -- Linux: borderless window (works well with tiling WMs)
        config.window_decorations = 'RESIZE'
    end
end

return M
