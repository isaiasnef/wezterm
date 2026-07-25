-- WezTerm Configuration
-- Compatible with Linux, Mac and Windows
-- Documentation: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Load platform-specific and feature modules
local platform = require 'config.platform'
local appearance = require 'config.appearance'
local keybindings = require 'config.keybindings'

-- Apply appearance settings
appearance.apply(config)

-- Apply key bindings
keybindings.apply(config)

-- Apply platform-specific settings
platform.apply(config)

return config
