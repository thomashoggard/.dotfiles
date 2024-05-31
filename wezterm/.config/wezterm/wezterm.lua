local wezterm = require 'wezterm'

return {
  color_scheme = 'kanagawabones',
  colors = {
    background = '#191717'
  },
  -- color_scheme = 'Kanagawa Dragon (Gogh)',
  enable_tab_bar = false,
  font_size = 15,
  font = wezterm.font {
    family = 'JetBrains Mono',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }
}
