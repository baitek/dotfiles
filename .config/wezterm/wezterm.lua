-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.window_frame = {
	font = wezterm.font("JetBrainsMonoNL Nerd Font"),
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

local act = wezterm.action
config.mouse_bindings = {
	-- Bind 'Up' event of CTRL-Click to open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
	-- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.Nop,
	},
}

-- and finally, return the configuration to wezterm
return config
