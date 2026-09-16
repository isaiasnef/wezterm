local wezterm = require('wezterm')
local platform = require('utils.platform')

---@type Config
local options = {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {},

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {},
}

if platform.is_win then
   -- Autodetectar dominios WSL disponibles en lugar de forzar usuarios o distros fijas
   local default_wsl_domains = wezterm.default_wsl_domains()
   options.wsl_domains = default_wsl_domains
end

return options
