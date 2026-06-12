local hl = hl or {}
require("input")

-- Essential variables
local mod = "SUPER"
local terminal = "kitty"
local fileManager = "kitty yazi"
local menu = "rofi -show drun"

-- Apps / Session binds
hl.bind(mod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + W", hl.dsp.exec_cmd("zen-beta"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + Escape", hl.dsp.exec_cmd("wlogout"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("grimblast --notify copy area"))


-- Monitors
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1 })
hl.monitor({
  output = "HDMI-A-1",
  mode = "1920x1080",
  position = "auto",
  scale = 1,
  mirror = "eDP-1",
})

-- Window Management
hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + C", hl.dsp.window.kill())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- Focus
hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
  local key = i % 10
  hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. "+ SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.on("hyprland.start", function()
  hl.exec_cmd("mako")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end
)

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})
