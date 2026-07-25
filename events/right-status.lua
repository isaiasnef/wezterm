local wezterm = require('wezterm')

local M = {}

M.setup = function()
   wezterm.on('update-status', function(window, _pane)
      window:set_right_status(wezterm.format({
         { Foreground = { Color = '#fab387' } },
         { Text = '  ' .. wezterm.nerdfonts.md_clock_outline .. ' ' .. wezterm.strftime('%H:%M') .. '  ' },
      }))
   end)
end

return M
