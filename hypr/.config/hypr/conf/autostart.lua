-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("waybar & swaync & hypridle & hyprpaper")
	hl.exec_cmd("/usr/lib/pam_kwallet_init")
	hl.exec_cmd("/usr/bin/kwalletd6")
	hl.exec_cmd("/usr/lib/geoclue-2.0/demos/agent")
	hl.exec_cmd("~/.config/hypr/scripts/unlock-keepass.sh")
	hl.exec_cmd("~/.config/hypr/scripts/workspace_setup.sh")
end)
