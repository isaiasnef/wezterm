local wezterm = require('wezterm')

-- Powerline glyphs for tab shape (parallelogram/angled style)
-- Reference: https://zenn.dev/mozumasu/articles/mozumasu-wezterm-customization
local SOLID_LEFT_ARROW  = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

local M = {}

M.setup = function()
   wezterm.on('format-tab-title', function(tab, _tabs, _panes, _config, _hover, max_width)
      local background = '#5c6d74'
      local foreground = '#FFFFFF'
      local edge_background = 'none'

      if tab.is_active then
         background = '#ae8b2d'
         foreground = '#FFFFFF'
      end

      local edge_foreground = background
      local title = '   ' .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. '   '

      return {
         { Background = { Color = edge_background } },
         { Foreground = { Color = edge_foreground } },
         { Text = SOLID_LEFT_ARROW },
         { Background = { Color = background } },
         { Foreground = { Color = foreground } },
         { Text = title },
         { Background = { Color = edge_background } },
         { Foreground = { Color = edge_foreground } },
         { Text = SOLID_RIGHT_ARROW },
      }
   end)

   wezterm.on('tabs.manual-update-tab-title', function(window, pane)
      window:perform_action(
         wezterm.action.PromptInputLine({
            description = wezterm.format({
               { Foreground = { Color = '#FFFFFF' } },
               { Attribute = { Intensity = 'Bold' } },
               { Text = 'Enter new name for tab' },
            }),
            action = wezterm.action_callback(function(_window, _pane, line)
               if line ~= nil then
                  local tab = _window:active_tab()
                  tab:set_title(line)
               end
            end),
         }),
         pane
      )
   end)

   wezterm.on('tabs.reset-tab-title', function(window, _pane)
      local tab = window:active_tab()
      tab:set_title('')
   end)

   wezterm.on('tabs.toggle-tab-bar', function(window, _pane)
      local effective_config = window:effective_config()
      window:set_config_overrides({
         enable_tab_bar = not effective_config.enable_tab_bar,
      })
   end)
end

return M
