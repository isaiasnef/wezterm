-- config/appearance.lua
-- Appearance settings: fonts, colors, window, and tab bar

local wezterm = require 'wezterm'

local M = {}

function M.apply(config)
    -- ─── Font ───────────────────────────────────────────────────────────────
    -- Ordered list with cross-platform fallbacks:
    --   JetBrains Mono / Fira Code  → popular on Linux/Mac
    --   Cascadia Code               → ships with Windows Terminal
    --   Consolas                    → built-in Windows font
    --   monospace                   → generic Linux fallback
    config.font = wezterm.font_with_fallback {
        { family = 'JetBrains Mono', weight = 'Regular' },
        { family = 'Fira Code',      weight = 'Regular' },
        { family = 'Cascadia Code',  weight = 'Regular' },
        'Consolas',
        'monospace',
    }
    -- font_size is overridden per-platform in config/platform.lua
    config.font_size = 12.0

    -- Enable font ligatures
    config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

    -- ─── Color Scheme ────────────────────────────────────────────────────────
    config.color_scheme = 'Catppuccin Mocha'

    -- ─── Window ──────────────────────────────────────────────────────────────
    config.window_background_opacity = 0.95
    config.window_padding = {
        left   = 10,
        right  = 10,
        top    = 10,
        bottom = 10,
    }

    -- Keep a reasonable minimum window size
    config.initial_cols = 120
    config.initial_rows = 30

    -- ─── Cursor ──────────────────────────────────────────────────────────────
    config.default_cursor_style = 'BlinkingBar'
    config.cursor_blink_rate    = 500

    -- ─── Tab Bar ─────────────────────────────────────────────────────────────
    config.enable_tab_bar            = true
    config.hide_tab_bar_if_only_one_tab = true
    config.tab_bar_at_bottom         = false
    config.use_fancy_tab_bar         = true
    config.tab_max_width             = 32

    -- ─── Scrollback ──────────────────────────────────────────────────────────
    config.scrollback_lines = 10000

    -- ─── Bell ────────────────────────────────────────────────────────────────
    config.audible_bell = 'Disabled'
end

return M
