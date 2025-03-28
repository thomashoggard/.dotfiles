local wezterm = require("wezterm")
local additional_settings = require("additional-settings")

local config = wezterm.config_builder()

config.max_fps = 120
config.term = "wezterm"
config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Kanagawa Dragon (Gogh)"

-- config.color_scheme = "Catppuccin Mocha"
-- config.colors = {
--   background = "#070D1C",
-- }

-- JetBrains Mono is packaged within wezterm.
-- config.font = wezterm.font({
--   family = "JetBrains Mono",
--   weight = "Medium",
-- })

config.enable_tab_bar = false

config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

additional_settings.apply_to_config(config)

return config
