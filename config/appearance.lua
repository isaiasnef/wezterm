local gpu_adapters = require('utils.gpu-adapter')

---@type Config
return {
   max_fps = 120,
   front_end = 'WebGpu', ---@type 'WebGpu' | 'OpenGL' | 'Software'
   webgpu_power_preference = 'HighPerformance',
   webgpu_preferred_adapter = gpu_adapters:pick_best(),
   -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Dx12', 'IntegratedGpu'),
   -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Gl', 'Other'),
   underline_thickness = '1.5pt',

   -- cursor
   animation_fps = 120,
   cursor_blink_ease_in = 'EaseOut',
   cursor_blink_ease_out = 'EaseOut',
   default_cursor_style = 'BlinkingBlock',
   cursor_blink_rate = 650,

   -- IME input support
   use_ime = true,

   -- color scheme
   color_scheme = 'Nord',

   -- window transparency: shows the real desktop through the window
   window_background_opacity = 0.85,
   macos_window_background_blur = 20,

   -- Unifies terminal background with the transparent tab bar area.
   -- Combined with opacity + blur gives the frosted glass look.
   window_background_gradient = {
      colors = { '#000000' },
   },

   -- scrollbar
   enable_scroll_bar = true,

   -- tab bar (use_fancy_tab_bar defaults to true — required for tab bar transparency)
   enable_tab_bar = true,
   tab_bar_at_bottom = false,
   hide_tab_bar_if_only_one_tab = true,
   show_tabs_in_tab_bar = true,
   show_tab_index_in_tab_bar = false,
   show_new_tab_button_in_tab_bar = false,
   switch_to_last_active_tab_when_closing_tab = true,

   -- tab bar transparency via window_frame (only works with use_fancy_tab_bar = true)
   window_frame = {
      active_titlebar_bg = 'none',
      inactive_titlebar_bg = 'none',
   },

   -- hide borders between tabs
   colors = {
      tab_bar = {
         inactive_tab_edge = 'none',
      },
   },

   -- command palette
   command_palette_fg_color = '#b4befe',
   command_palette_bg_color = '#11111b',
   command_palette_font_size = 12,
   command_palette_rows = 25,

   -- window
   window_padding = {
      left = '0.5cell',
      right = '0.5cell',
      top = '0.35cell',
      bottom = '0.35cell',
   },
   adjust_window_size_when_changing_font_size = false,
   window_decorations = 'RESIZE',
   window_close_confirmation = 'NeverPrompt',
   inactive_pane_hsb = {
      saturation = 1,
      brightness = 1,
   },

   visual_bell = {
      fade_in_function = 'EaseIn',
      fade_in_duration_ms = 250,
      fade_out_function = 'EaseOut',
      fade_out_duration_ms = 250,
      target = 'CursorColor',
   },
}
