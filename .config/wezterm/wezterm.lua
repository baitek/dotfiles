-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("JetBrainsMonoNLNerdFont")
config.window_frame = {
	font = wezterm.font("JetBrainsMonoNLNerdFont"),
}
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 0,
}

config.enable_tab_bar = false
config.scrollback_lines = 10000
config.window_decorations = "NONE"

-- and finally, return the configuration to wezterm
return config
