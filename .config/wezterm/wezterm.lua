-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Night Owl (Gogh)"
config.font = wezterm.font("Inconsolata LGC Nerd Font Mono")
config.font_size = 15.5

config.initial_rows = 71
config.initial_cols = 315

config.enable_tab_bar = false

config.enable_scroll_bar = false
config.scrollback_lines = 10240

config.window_padding = {
	left = "9px",
	right = "9px",
	top = "3px",
	bottom = "3px",
}

config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 1,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 200,
}

config.colors = {
	visual_bell = "#200000",
}

config.window_frame = {
	border_left_width = "2px",
	border_right_width = "2px",
	border_bottom_height = "2px",
	border_top_height = "2px",
	border_left_color = "#333",
	border_right_color = "#333",
	border_bottom_color = "#333",
	border_top_color = "#333",
}

config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- and finally, return the configuration to wezterm
return config
