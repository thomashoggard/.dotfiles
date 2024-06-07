local wezterm = require 'wezterm'
local additional_settings = require "additional-settings"

local config = {
  color_scheme = 'Tokyo Night',
  -- colors = {
  --   background = '#191717'
  -- },
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

additional_settings.apply_to_config(config)

return config
