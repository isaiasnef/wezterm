local wezterm = require('wezterm')
local platform = require('utils.platform')
local backdrops = require('utils.backdrops')
local act = wezterm.action

local mod = {}

if platform.is_mac then
   mod.PRIMARY = 'SUPER'
   mod.PRIMARY_REV = 'SUPER|SHIFT'
   mod.TAB_NUM = 'SUPER'
elseif platform.is_win or platform.is_linux then
   mod.PRIMARY = 'CTRL|SHIFT'
   mod.PRIMARY_REV = 'CTRL|ALT'
   mod.TAB_NUM = 'ALT'
end

-- stylua: ignore
---@type Key[]
local keys = {
   -- misc/useful --
   { key = 'F1',  mods = 'NONE', action = act.ActivateCopyMode },
   { key = 'F2',  mods = 'NONE', action = act.ActivateCommandPalette },
   { key = 'F3',  mods = 'NONE', action = act.ShowLauncher },
   { key = 'F4',  mods = 'NONE', action = act.ShowLauncherArgs({ flags = 'FUZZY|TABS' }) },
   { key = 'F5',  mods = 'NONE', action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }) },
   { key = 'F9',  mods = 'NONE', action = act.EmitEvent('tabs.toggle-tab-bar') },
   { key = 'F11', mods = 'NONE', action = act.ToggleFullScreen },
   { key = 'F12', mods = 'NONE', action = act.ShowDebugOverlay },
   { key = 'p',   mods = mod.PRIMARY, action = act.ActivateCommandPalette },
   { key = 'f',   mods = mod.PRIMARY, action = act.Search({ CaseInSensitiveString = '' }) },
   {
      key = 'u',
      mods = mod.PRIMARY,
      action = wezterm.action.QuickSelectArgs({
         label = 'open url',
         patterns = {
            '\\((https?://\\S+)\\)',
            '\\[(https?://\\S+)\\]',
            '\\{(https?://\\S+)\\}',
            '<(https?://\\S+)>',
            '\\bhttps?://\\S+[)/a-zA-Z0-9-]+',
         },
         action = wezterm.action_callback(function(window, pane)
            local url = window:get_selection_text_for_pane(pane)
            wezterm.log_info('opening: ' .. url)
            wezterm.open_with(url)
         end),
      }),
   },

   -- copy/paste --
   { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
   { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },

   -- leader escape: send literal Ctrl+a when pressing 'a' after leader --
   { key = 'a', mods = 'LEADER', action = act.SendString('\u{01}') },

   -- tabs --
   -- tabs: spawn + close
   { key = 't', mods = mod.PRIMARY, action = act.SpawnTab('DefaultDomain') },
   { key = 'w', mods = mod.PRIMARY, action = act.CloseCurrentTab({ confirm = false }) },

   -- tabs: navigation
   { key = 'Tab', mods = 'CTRL',       action = act.ActivateTabRelative(1) },
   { key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },

   -- tabs: move tabs relative (relocation)
   { key = 'PageUp',   mods = 'CTRL|SHIFT', action = act.MoveTabRelative(-1) },
   { key = 'PageDown', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(1) },

   -- tabs: navigate directly by number
   { key = '1', mods = mod.TAB_NUM, action = act.ActivateTab(0) },
   { key = '2', mods = mod.TAB_NUM, action = act.ActivateTab(1) },
   { key = '3', mods = mod.TAB_NUM, action = act.ActivateTab(2) },
   { key = '4', mods = mod.TAB_NUM, action = act.ActivateTab(3) },
   { key = '5', mods = mod.TAB_NUM, action = act.ActivateTab(4) },
   { key = '6', mods = mod.TAB_NUM, action = act.ActivateTab(5) },
   { key = '7', mods = mod.TAB_NUM, action = act.ActivateTab(6) },
   { key = '8', mods = mod.TAB_NUM, action = act.ActivateTab(7) },
   { key = '9', mods = mod.TAB_NUM, action = act.ActivateTab(-1) },

   -- tab: title & bar controls with Leader (alphanumeric, no ISO keyboard collisions)
   { key = 't', mods = 'LEADER', action = act.EmitEvent('tabs.manual-update-tab-title') },
   { key = 'T', mods = 'LEADER', action = act.EmitEvent('tabs.reset-tab-title') },
   { key = 'z', mods = 'LEADER', action = act.EmitEvent('tabs.toggle-tab-bar') },

   -- window --
   -- window: spawn windows
   { key = 'n', mods = mod.PRIMARY, action = act.SpawnWindow },

   -- window: zoom / maximize window
   {
      key = 'm',
      mods = mod.PRIMARY,
      action = wezterm.action_callback(function(window, _pane)
         window:maximize()
      end),
   },

   -- background controls (Leader key driven, alphanumeric) --
   {
      key = 'b',
      mods = 'LEADER',
      action = wezterm.action_callback(function(window, _pane)
         backdrops:toggle_focus(window)
      end),
   },
   {
      key = 'n',
      mods = 'LEADER',
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_forward(window)
      end),
   },
   {
      key = 'p',
      mods = 'LEADER',
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_back(window)
      end),
   },
   {
      key = 's',
      mods = 'LEADER',
      action = act.InputSelector({
         title = 'InputSelector: Select Background',
         choices = backdrops:choices(),
         fuzzy = true,
         fuzzy_description = 'Select Background: ',
         action = wezterm.action_callback(function(window, _pane, idx)
            if not idx then
               return
            end
            ---@diagnostic disable-next-line: param-type-mismatch
            backdrops:set_img(window, tonumber(idx))
         end),
      }),
   },

   -- panes --
   -- panes: split panes (d: horizontal, e: vertical)
   { key = 'd', mods = mod.PRIMARY, action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
   { key = 'e', mods = mod.PRIMARY, action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },

   -- panes: zoom + close pane
   { key = 'Enter', mods = mod.PRIMARY, action = act.TogglePaneZoomState },
   { key = 'x',     mods = mod.PRIMARY, action = act.CloseCurrentPane({ confirm = false }) },

   -- panes: swap / relocate pane with visual picker
   {
      key = 'w',
      mods = 'LEADER',
      action = act.PaneSelect({
         mode = 'SwapWithActiveKeepFocus',
         alphabet = '1234567890',
      }),
   },

   -- panes: navigation
   { key = 'k', mods = mod.PRIMARY_REV, action = act.ActivatePaneDirection('Up') },
   { key = 'j', mods = mod.PRIMARY_REV, action = act.ActivatePaneDirection('Down') },
   { key = 'h', mods = mod.PRIMARY_REV, action = act.ActivatePaneDirection('Left') },
   { key = 'l', mods = mod.PRIMARY_REV, action = act.ActivatePaneDirection('Right') },

   -- panes: scroll pane
   { key = 'PageUp',   mods = 'NONE', action = act.ScrollByPage(-0.75) },
   { key = 'PageDown', mods = 'NONE', action = act.ScrollByPage(0.75) },

   -- key-tables --
   -- resizes fonts
   {
      key = 'f',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_font',
         one_shot = false,
         timeout_milliseconds = 2000,
      }),
   },
   -- resize panes (2500ms timeout, responsive step of 3 cells, dual arrows/hjkl support)
   {
      key = 'r',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_pane',
         one_shot = false,
         timeout_milliseconds = 2500,
         until_unknown = true,
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
      { key = 'k',          action = act.AdjustPaneSize({ 'Up', 3 }) },
      { key = 'j',          action = act.AdjustPaneSize({ 'Down', 3 }) },
      { key = 'h',          action = act.AdjustPaneSize({ 'Left', 3 }) },
      { key = 'l',          action = act.AdjustPaneSize({ 'Right', 3 }) },
      { key = 'UpArrow',    action = act.AdjustPaneSize({ 'Up', 3 }) },
      { key = 'DownArrow',  action = act.AdjustPaneSize({ 'Down', 3 }) },
      { key = 'LeftArrow',  action = act.AdjustPaneSize({ 'Left', 3 }) },
      { key = 'RightArrow', action = act.AdjustPaneSize({ 'Right', 3 }) },
      { key = 'Escape',     action = 'PopKeyTable' },
      { key = 'q',          action = 'PopKeyTable' },
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

if platform.is_mac then
   table.insert(keys, { key = 'c', mods = 'SUPER', action = act.CopyTo('Clipboard') })
   table.insert(keys, { key = 'v', mods = 'SUPER', action = act.PasteFrom('Clipboard') })
end

---@type Config
return {
   disable_default_key_bindings = true,
   leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
   keys = keys,
   key_tables = key_tables,
   mouse_bindings = mouse_bindings,
}
