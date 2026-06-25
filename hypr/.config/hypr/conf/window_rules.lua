-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- 1. Hide the main valult window on boot
hl.window_rule({
	name = "hide-keepass-vault",
	match = {
		class = [[org\.keepassxc\.KeePassXC]],
		initial_title = "Passwords - KeePassXC",
	},
	workspace = "special:magic silent",
})

hl.window_rule({
	name = "show-passkey-prompts",
	match = {
		class = [[org\.keepassxc\.KeePassXC]],
		initial_title = "KeePassXC - Passkey credentials",
	},
	float = true,
	center = true,
	workspace = "unset",
	focus_on_activate = true,
})

-- For showmethekey
hl.window_rule({
	float = true,
	match = { class = "^(one.alynx.showmethekey)$" },
})

hl.window_rule({
	float = true,
	pin = true,
	match = { class = "^(showmethekey-gtk)$" },
})
