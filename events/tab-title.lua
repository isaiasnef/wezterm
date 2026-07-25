local wezterm = require('wezterm')

local M = {}

M.setup = function()
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
         background = effective_config.background,
      })
   end)
end

return M
