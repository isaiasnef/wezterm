local wezterm = require('wezterm')
local platform = require('utils.platform')
local backdrops = require('utils.backdrops')
local act = wezterm.action

local mod = {}

if platform.is_mac then
   mod.SUPER = 'SUPER'
   mod.SUPER_REV = 'SUPER|CTRL'
elseif platform.is_win or platform.is_linux then
   mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
   mod.SUPER_REV = 'ALT|CTRL'
end

-- Modifier conventions (portable across Mac / Windows / Linux):
--   SUPER       = CMD (Mac)  /  ALT (Win-Linux)
--   SUPER_REV   = CMD+CTRL (Mac)  /  ALT+CTRL (Win-Linux)
--   LEADER      = CMD+CTRL+a (Mac)  /  ALT+CTRL+a (Win-Linux)  timeout=3000ms
--
-- 60% ISO Spanish keyboard notes:
--   - No direct arrow keys (require Fn); arrow-based shortcuts removed.
--   - No direct F-keys (conflict with macOS system shortcuts); replaced by LEADER+key.
--   - No PageUp/PageDown; replaced by SUPER+SHIFT+u/d.
--   - Splits on 'v' (vertical divider) and 'h' (horizontal divider).
--   - '/' requires SHIFT on Spanish layout; background shortcuts use letters instead.
--
-- Split naming (WezTerm API):
--   SplitHorizontal -> panes side-by-side (vertical divider) -> 'v'
--   SplitVertical   -> panes stacked (horizontal divider)    -> 'h'

-- stylua: ignore
---@type Key[]
local keys = {

   -- font size (letter keys: k/j/r — direct on all keyboard layouts) --
   { key = 'k', mods = mod.SUPER, action = act.IncreaseFontSize },
   { key = 'j', mods = mod.SUPER, action = act.DecreaseFontSize },
   { key = 'r', mods = mod.SUPER, action = act.ResetFontSize },

   -- search --
   { key = 'f', mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = '' }) },

   -- open url --
   {
      key = 'u',
      mods = mod.SUPER_REV,
      action = wezterm.action.QuickSelectArgs({
         label = 'open url',
         patterns = {
            '\\((https?://\\S+)\\)',
            '\\[(https?://\\S+)\\]',
            '\\{(https?://\\S+)\\}',
            '<(https?://\\S+)>',
            '\\bhttps?://\\S+[)/a-zA-Z0-9-]+'
         },
         action = wezterm.action_callback(function(window, pane)
            local url = window:get_selection_text_for_pane(pane)
            wezterm.log_info('opening: ' .. url)
            wezterm.open_with(url)
         end),
      }),
   },

   -- cursor movement (no arrow keys; arrows require Fn on 60% keyboards) --
   { key = 'Backspace', mods = mod.SUPER, action = act.SendString('\u{15}') },

   -- copy/paste --
   { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
   { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },

   -- tabs: spawn + close --
   { key = 't', mods = mod.SUPER,     action = act.SpawnTab('DefaultDomain') },
   { key = 't', mods = mod.SUPER_REV, action = act.SpawnTab({ DomainName = 'wsl:ubuntu-fish' }) },
   { key = 'w', mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },

   -- tabs: navigation --
   { key = '[', mods = mod.SUPER,     action = act.ActivateTabRelative(-1) },
   { key = ']', mods = mod.SUPER,     action = act.ActivateTabRelative(1) },
   { key = '[', mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
   { key = ']', mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

   -- tabs: title (rename via LEADER+r; reset kept as direct shortcut) --
   { key = '0', mods = mod.SUPER,     action = act.EmitEvent('tabs.manual-update-tab-title') },
   { key = '0', mods = mod.SUPER_REV, action = act.EmitEvent('tabs.reset-tab-title') },

   -- tabs: toggle tab bar --
   { key = '9', mods = mod.SUPER, action = act.EmitEvent('tabs.toggle-tab-bar') },

   -- window: spawn --
   { key = 'n', mods = mod.SUPER, action = act.SpawnWindow },

   -- window: resize ±50px (letter keys: e/s — direct on all keyboard layouts) --
   {
      key = 's',
      mods = mod.SUPER_REV,
      action = wezterm.action_callback(function(window, _pane)
         local dimensions = window:get_dimensions()
         if platform.is_win or dimensions.is_full_screen then return end
         window:set_inner_size(dimensions.pixel_width - 50, dimensions.pixel_height - 50)
      end)
   },
   {
      key = 'e',
      mods = mod.SUPER_REV,
      action = wezterm.action_callback(function(window, _pane)
         local dimensions = window:get_dimensions()
         if platform.is_win or dimensions.is_full_screen then return end
         window:set_inner_size(dimensions.pixel_width + 50, dimensions.pixel_height + 50)
      end)
   },

   -- window: maximize --
   {
      key = 'Enter',
      mods = mod.SUPER_REV,
      action = wezterm.action_callback(function(window, _pane)
         window:maximize()
      end)
   },

   -- backgrounds --
   -- Note: '/' requires SHIFT on Spanish keyboard so it's replaced with letter keys
   {
      key = 'r',
      mods = mod.SUPER_REV,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:random(window)
      end),
   },
   {
      key = [[,]],
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_back(window)
      end),
   },
   {
      key = [[.]],
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_forward(window)
      end),
   },
   {
      key = 'b',
      mods = mod.SUPER_REV,
      action = act.InputSelector({
         title = 'InputSelector: Select Background',
         choices = backdrops:choices(),
         fuzzy = true,
         fuzzy_description = 'Select Background: ',
         action = wezterm.action_callback(function(window, _pane, idx)
            if not idx then return end
            ---@diagnostic disable-next-line: param-type-mismatch
            backdrops:set_img(window, tonumber(idx))
         end),
      }),
   },
   {
      key = 'b',
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:toggle_focus(window)
      end)
   },

   -- panes: split --
   -- 'h' = horizontal divider (stacked),  'v' = vertical divider (side-by-side)
   -- SUPER+SHIFT: direct, for general use outside opencode
   -- LEADER+h/v:  reliable inside opencode (see LEADER section below)
   { key = 'h', mods = mod.SUPER .. '|SHIFT', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },
   { key = 'v', mods = mod.SUPER .. '|SHIFT', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },

   -- panes: zoom + close --
   { key = 'Enter', mods = mod.SUPER, action = act.TogglePaneZoomState },
   { key = 'w',     mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },

   -- panes: navigation (vim-style, no arrow keys needed) --
   { key = 'k', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Up') },
   { key = 'j', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Down') },
   { key = 'h', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Left') },
   { key = 'l', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Right') },
   {
      key = 'p',
      mods = mod.SUPER_REV,
      action = act.PaneSelect({ alphabet = '1234567890', mode = 'SwapWithActiveKeepFocus' }),
   },

   -- panes: scroll (no PageUp/PageDown; requires Fn on 60% keyboards) --
   { key = 'u', mods = mod.SUPER,            action = act.ScrollByLine(-5) },
   { key = 'd', mods = mod.SUPER,            action = act.ScrollByLine(5) },
   { key = 'u', mods = mod.SUPER .. '|SHIFT', action = act.ScrollByPage(-0.75) },
   { key = 'd', mods = mod.SUPER .. '|SHIFT', action = act.ScrollByPage(0.75) },

   -- LEADER one-shot actions --
   -- Replaces F1-F12 (conflict with macOS system shortcuts on 60% keyboards).
   -- Splits also work inside opencode (which intercepts SUPER+SHIFT+h/v).
   -- Rename tab (LEADER+r) replaces the former CMD+0 direct shortcut.
   { key = 'c',     mods = 'LEADER', action = act.ActivateCopyMode },
   { key = ',',     mods = 'LEADER', action = act.ActivateCommandPalette },
   { key = 'Space', mods = 'LEADER', action = act.ShowLauncher },
   { key = 'Enter', mods = 'LEADER', action = act.ToggleFullScreen },
   { key = 'd',     mods = 'LEADER', action = act.ShowDebugOverlay },
   { key = 'v',     mods = 'LEADER', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
   { key = 'h',     mods = 'LEADER', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },
   { key = 'r',     mods = 'LEADER', action = act.EmitEvent('tabs.manual-update-tab-title') },
   { key = 'R',     mods = 'LEADER', action = act.EmitEvent('tabs.reset-tab-title') },
   { key = 'b',     mods = 'LEADER', action = act.EmitEvent('tabs.toggle-tab-bar') },

   -- LEADER persistent modes (no timeout: stays active until Esc/q) --
   {
      key = 'f',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_font',
         one_shot = false,
      }),
   },
   {
      key = 'p',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_pane',
         one_shot = false,
      }),
   },
}

-- stylua: ignore
---@type table<string, Key[]>
local key_tables = {
   resize_font = {
      { key = 'k',      action = act.IncreaseFontSize },
      { key = 'j',      action = act.DecreaseFontSize },
      { key = 'r',      action = act.ResetFontSize },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q',      action = 'PopKeyTable' },
   },
   resize_pane = {
      { key = 'k',      action = act.AdjustPaneSize({ 'Up', 1 }) },
      { key = 'j',      action = act.AdjustPaneSize({ 'Down', 1 }) },
      { key = 'h',      action = act.AdjustPaneSize({ 'Left', 1 }) },
      { key = 'l',      action = act.AdjustPaneSize({ 'Right', 1 }) },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q',      action = 'PopKeyTable' },
   },
}

---@type MouseBinding[]
local mouse_bindings = {
   -- Ctrl-click will open the link under the mouse cursor
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
   },
}

---@type Config
return {
   disable_default_key_bindings = true,
   -- disable_default_mouse_bindings = true,
   leader = { key = 'a', mods = mod.SUPER_REV, timeout_milliseconds = 3000 },
   keys = keys,
   key_tables = key_tables,
   mouse_bindings = mouse_bindings,
}
