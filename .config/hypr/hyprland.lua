local u = require("utils")

--
-- monitors
--

hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@144",
	position = "0x0",
	scale = "1",
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "0x-1080",
	scale = "1",
})

-- hl.config({
-- 	debug = {
-- 		overlay = true,
-- 	},
-- })

--
-- general
--

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 2,
		no_focus_fallback = true,

		col = {
			active_border = "rgba(0000ffff)",
			inactive_border = "rgba(000000ff)",
		},
	},

	animations = {
		enabled = false,
	},

	dwindle = {
		-- pseudotile = true
		force_split = 2,
		preserve_split = true,
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		middle_click_paste = false,
	},

	input = {
		kb_layout = "us, ru",
		-- alt + = + p
		kb_options = "grp:alt_shift_toggle,compose:ralt",

		follow_mouse = 1,
		sensitivity = 0,
		accel_profile = "flat",

		-- repeat_delay = 128
		touchpad = {
			natural_scroll = true,
		},
	},
	cursor = {
		hide_on_key_press = true,

		-- wlfreerdp3/qemu cursor supposed fix
		no_hardware_cursors = true,
	},
	ecosystem = {
		no_update_news = true,
	},
})

--
-- autostart
--

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("mako")
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd(u.alacritty({ cmd = "tenki", args = "--mode disable" }), { workspace = "name:tenki silent" })
	hl.exec_cmd(u.alacritty({ cmd = "btop" }), { workspace = "name:btop silent" })
	hl.exec_cmd("Telegram -startintray")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 32")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

--
-- binds
--

hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind("SUPER + W", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + CONTROL + W", hl.dsp.exec_cmd("firefox --private-window"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER + SHIFT + CONTROL + W", hl.dsp.exec_cmd("zen-browser --incognito"))
hl.bind("SUPER + E", hl.dsp.exec_cmd(u.alacritty({ cmd = "zsh", args = '-ic "y; zsh"', class = "yazi" })))
hl.bind("SUPER + R", hl.dsp.exec_cmd("tofi-drun --drun-launch=true"))
hl.bind("SUPER + SHIFT + R", hl.dsp.focus({ workspace = "name:rdp" }))
hl.bind("SUPER + T", function()
	hl.dispatch(hl.dsp.focus({ workspace = "name:telegram" }))
	hl.dispatch(hl.dsp.exec_cmd("Telegram"))
end)
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd(u.alacritty({ cmd = "tenki", args = "--mode disable" })))
hl.bind("SUPER + Y", function()
	hl.dispatch(hl.dsp.focus({ workspace = "name:yandex-music" }))
	hl.dispatch(hl.dsp.exec_cmd("yandex-music"))
end)
hl.bind("SUPER + I", hl.dsp.exec_cmd(u.alacritty({ cmd = "impala" })))
hl.bind("SUPER + P", hl.dsp.exec_cmd("hyprpicker"))

hl.bind("SUPER + A", hl.dsp.exec_cmd(u.alacritty()))
hl.bind("SUPER + S", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + D", function()
	hl.dispatch(hl.dsp.focus({ workspace = "name:discord" }))
	hl.dispatch(hl.dsp.exec_cmd("discord"))
end)
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

hl.bind("SUPER + C", hl.dsp.exec_cmd(u.alacritty({ cmd = "clipse", args = "-enable-real-time" })))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd(u.alacritty({ cmd = "numbat" })))
hl.bind("SUPER + B", hl.dsp.exec_cmd(u.alacritty({ cmd = "bluetui" })))
hl.bind("SUPER + N", hl.dsp.exec_cmd(u.alacritty({ cmd = "zsh", args = '-ic "nvim; zsh"', class = "nvim" })))
hl.bind(
	"SUPER + SHIFT + N",
	hl.dsp.exec_cmd(u.alacritty({ dir = "~/.config/hypr", cmd = "nvim", args = "hyprland.lua" }))
)
hl.bind("SUPER + CONTROL + N", hl.dsp.exec_cmd(u.alacritty({ dir = "~/.config/nvim/lua", cmd = "nvim", args = "." })))
hl.bind("SUPER + SHIFT + CONTROL + N", hl.dsp.exec_cmd(u.alacritty({ dir = "~/.config", cmd = "nvim", args = "." })))
hl.bind("SUPER + M", hl.dsp.exec_cmd(u.alacritty({ cmd = "pulsemixer" })))

hl.bind("XF86Calculator", hl.dsp.exec_cmd(u.alacritty({ cmd = "numbat" })))
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grim - | wayland-boomer"))
hl.bind("KP_Subtract", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))
hl.bind("SUPER + SHIFT + Backspace", hl.dsp.exit())
hl.bind("CONTROL + ALT + Backspace", hl.dsp.exec_cmd(u.alacritty({ cmd = "btop" })))
hl.bind("SUPER + Space", hl.dsp.layout("togglesplit"))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())

--
-- workspace rules
--

hl.workspace_rule({
	workspace = "1",
	monitor = "eDP-1",
	default = true,
})

local eDP = {}

for i = 2, 10 do
	table.insert(eDP, i)
end

table.insert(eDP, "name:btop")
table.insert(eDP, "name:telegram")
table.insert(eDP, "name:discord")
table.insert(eDP, "name:yandex-music")

for _, w in ipairs(eDP) do
	hl.workspace_rule({
		workspace = tostring(w),
		monitor = "eDP-1",
	})
end

local HDMI = {}

for i = 11, 20 do
	table.insert(HDMI, i)
end

table.insert(HDMI, "name:tenki")
table.insert(HDMI, "name:rdp")

for _, w in ipairs(HDMI) do
	hl.workspace_rule({
		workspace = tostring(w),
		monitor = "HDMI-A-1",
	})
end

--
-- workspace binds
--

for i = 1, 10 do
	local key = tostring(i % 10)

	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + CONTROL + " .. key, hl.dsp.window.move({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.focus({ workspace = i + 10 }))
	hl.bind("SUPER + SHIFT + CONTROL + " .. key, hl.dsp.window.move({ workspace = i + 10 }))
end

hl.bind("SUPER + Grave", hl.dsp.focus({ workspace = "name:btop" }))
hl.bind("SUPER + Escape", hl.dsp.focus({ workspace = "name:btop" }))
hl.bind("SUPER + SHIFT + Grave", hl.dsp.focus({ workspace = "name:tenki" }))
hl.bind("SUPER + SHIFT + Escape", hl.dsp.focus({ workspace = "name:tenki" }))

--
-- window rules
--

hl.window_rule({
	name = "autohide",
	match = {
		focus = false,
		workspace = "m[1]",
	},

	opacity = 0.0,
})

hl.window_rule({
	name = "freerdp",
	match = {
		class = ".*freerdp.*",
	},
	float = true,
	size = "monitor_w-4 monitor_h-4",
	workspace = "name:rdp",
})

hl.window_rule({
	name = "ueberzugpp",
	match = {
		class = "ueberzugpp.*",
	},

	float = true,
	no_focus = true,
})

hl.window_rule({
	name = "flameshot",
	match = {
		class = "flameshot",
	},

	float = true,
	maximize = true,
	move = "0 0",
	pin = true,
	monitor = "0",
})

hl.window_rule({
	name = "clipse",
	match = {
		class = "clipse",
	},

	pin = true,
	float = true,
	stay_focused = true,
	size = "monitor_w-4 monitor_h-4",
})

hl.window_rule({
	name = "telegram",
	match = {
		class = "org.telegram.desktop",
	},

	workspace = "name:telegram",
	maximize = true,
})

hl.window_rule({
	name = "yandex-music",
	match = {
		class = "YandexMusic",
	},

	workspace = "name:yandex-music",
	maximize = true,
})

hl.window_rule({
	name = "boomer",
	match = {
		initial_title = "wayland-boomer",
	},

	float = true,
	stay_focused = true,
	fullscreen = true,
})

--
-- envs
--

hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "32")

hl.env("EDITOR", "nvim")
hl.env("TERMINAL", "alacritty")

hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card0:/dev/dri/card1")

-- wlfreerdp3/qemu cursor supposed fix
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
