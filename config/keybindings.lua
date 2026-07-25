-- config/keybindings.lua
-- Key bindings that work across Linux, Mac and Windows

local wezterm = require 'wezterm'
local act     = wezterm.action

local M = {}

function M.apply(config)
    -- Disable the default key table so we start from a clean slate
    -- but keep built-in bindings intact for better cross-platform compat
    config.disable_default_key_bindings = false

    config.keys = {
        -- ─── Clipboard ───────────────────────────────────────────────────────
        { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
        { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },

        -- ─── Tabs ────────────────────────────────────────────────────────────
        { key = 't',     mods = 'CTRL|SHIFT', action = act.SpawnTab 'CurrentPaneDomain' },
        { key = 'w',     mods = 'CTRL|SHIFT', action = act.CloseCurrentTab { confirm = true } },
        { key = 'Tab',   mods = 'CTRL',       action = act.ActivateTabRelative(1)  },
        { key = 'Tab',   mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },

        -- Direct tab selection (Ctrl+1 … Ctrl+9)
        { key = '1', mods = 'CTRL', action = act.ActivateTab(0) },
        { key = '2', mods = 'CTRL', action = act.ActivateTab(1) },
        { key = '3', mods = 'CTRL', action = act.ActivateTab(2) },
        { key = '4', mods = 'CTRL', action = act.ActivateTab(3) },
        { key = '5', mods = 'CTRL', action = act.ActivateTab(4) },
        { key = '6', mods = 'CTRL', action = act.ActivateTab(5) },
        { key = '7', mods = 'CTRL', action = act.ActivateTab(6) },
        { key = '8', mods = 'CTRL', action = act.ActivateTab(7) },
        { key = '9', mods = 'CTRL', action = act.ActivateTab(8) },

        -- ─── Panes ───────────────────────────────────────────────────────────
        -- Split
        {
            key    = 'h',
            mods   = 'CTRL|SHIFT|ALT',
            action = act.SplitPane { direction = 'Right', size = { Percent = 50 } },
        },
        {
            key    = 'v',
            mods   = 'CTRL|SHIFT|ALT',
            action = act.SplitPane { direction = 'Down', size = { Percent = 50 } },
        },
        -- Navigate between panes
        { key = 'LeftArrow',  mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left'  },
        { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },
        { key = 'UpArrow',    mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up'    },
        { key = 'DownArrow',  mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down'  },
        -- Close current pane
        { key = 'x', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane { confirm = true } },

        -- ─── Font size ───────────────────────────────────────────────────────
        { key = '=',  mods = 'CTRL', action = act.IncreaseFontSize },
        { key = '-',  mods = 'CTRL', action = act.DecreaseFontSize },
        { key = '0',  mods = 'CTRL', action = act.ResetFontSize    },

        -- ─── Search ──────────────────────────────────────────────────────────
        { key = 'f', mods = 'CTRL|SHIFT', action = act.Search { CaseInSensitiveString = '' } },

        -- ─── Miscellaneous ───────────────────────────────────────────────────
        { key = 'r', mods = 'CTRL|SHIFT', action = act.ReloadConfiguration },
        { key = 'z', mods = 'CTRL|SHIFT', action = act.TogglePaneZoomState },
        { key = 'F11',                    action = act.ToggleFullScreen     },
    }

    -- Mouse bindings
    config.mouse_bindings = {
        -- Right-click pastes from the clipboard
        {
            event  = { Down = { streak = 1, button = 'Right' } },
            mods   = 'NONE',
            action = act.PasteFrom 'Clipboard',
        },
        -- Ctrl+click opens hyperlinks
        {
            event  = { Up = { streak = 1, button = 'Left' } },
            mods   = 'CTRL',
            action = act.OpenLinkAtMouseCursor,
        },
    }
end

return M
