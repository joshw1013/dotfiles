-- TODO: Might be able to get scroll working with lua now

-- Cursor submap (similar to the Mouse mode in Sway)
--
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.define_submap("cursor", function()
	-- Click a spot
	hl.bind(
		"u",
		hl.dsp.exec_cmd(
			"hyprctl dispatch submap reset && wl-kbptr"
				.. "&& wlrctl pointer click left && ~/.config/hypr/scripts/center_mouse.sh"
		)
	)
	-- OG bind that I don't think I will do much but will see
	-- Jump cursor to a position
	hl.bind("a", hl.dsp.exec_cmd("hyprctl dispatch submap reset && wl-kbptr && hyprctl dispatch submap cursor"))

	-- Cursor movement
	hl.bind("j", hl.dsp.exec_cmd("wlrctl pointer move 0 10"), { repeating = true })
	hl.bind("k", hl.dsp.exec_cmd("wlrctl pointer move 0 -10"), { repeating = true })
	hl.bind("l", hl.dsp.exec_cmd("wlrctl pointer move 10 0"), { repeating = true })
	hl.bind("h", hl.dsp.exec_cmd("wlrctl pointer move -10 0"), { repeating = true })

	-- Left button
	hl.bind("s", hl.dsp.exec_cmd("wlrctl pointer click left"))
	-- Middle button
	hl.bind("d", hl.dsp.exec_cmd("wlrctl pointer click middle"))
	-- Right button
	hl.bind("f", hl.dsp.exec_cmd("wlrctl pointer click right"))

	-- Left click and hold
	hl.bind("g", hl.dsp.exec_cmd("~/.config/hypr/scripts/mouse_hold.sh"))

	-- Scroll up and down, this is not working
	-- hl.bind("e", hl.dsp.exec_cmd("wlrctl poitner scroll 10 0"))
	-- hl.bind("r", hl.dsp.exec_cmd("wlrctl poitner scroll -10 0"))

	-- Scroll up and down using ydotool, must be done here if I want repeat,
	-- as the scrolling interrupts Hyprland's default repeat

	-- Scroll Up
	-- hl.bind("e", hl.dsp.exec_cmd("~/.config/hypr/scripts/scroll.sh -1"))
	-- hl.bind("e", hl.dsp.exec_cmd("~/.config/hypr/scripts/stop_scroll.sh 'E'"), { release = true })

	-- Scroll down
	-- hl.bind("r", hl.dsp.exec_cmd("~/.config/hypr/scripts/scroll.sh 1"))
	-- hl.bind("r", hl.dsp.exec_cmd("~/.config/hypr/scripts/stop_scroll.sh 'R'"), { release = true })

	-- Scroll left and right
	hl.bind("t", hl.dsp.exec_cmd("wlrctl pointer scroll 0 -10"), { repeating = true })
	-- BUG: This binding will overwrite the previous g binding I believe
	hl.bind("g", hl.dsp.exec_cmd("wlrctl pointer scroll 0 10"), { repeating = true })

	hl.bind("escape", hl.dsp.exec_cmd("~/.config/hypr/scripts/stop_scroll.sh 1"))

	-- Exit cursor submap
	-- If you do not use cursor timeout or cursor:hide_on_key_press, you can delete its respective calls.
	-- hl.bind("escape", hl.dsp.exec_cmd("hyprctl keyword cursor:inactive_timeout 3; hyprctl keyword cursor:hide_on_key_press true; hyprctl dispatch submap resethyprctl dispatch submap reset"))
	-- hl.bind("escape", hl.dsp.exec_cmd("hyprctl dispatch submap reset"))
	hl.bind("escape", hl.dsp.exec_cmd("hyprctl keyword cursor:hide_on_key_press true; hyprctl dispatch submap reset"))
end)

-- Entrypoint
-- If you do not use cursor timeout or cursor:hide_on_key_press, you can delete its respective calls.
hl.bind(
	mainMod .. " + O",
	hl.dsp.exec_cmd(
		"hyprctl keyword cursor:inactive_timeout 0; hyprctl keyword cursor:hide_on_key_press false; hyprctl dispatch submap cursor"
	)
)

-- Click a spot, allow this outside of cursor mode)
hl.bind(
	mainMod .. " + U",
	hl.dsp.exec_cmd(
		"hyprctl dispatch submap reset && wl-kbptr && wlrctl pointer click left && ~/.config/hypr/scripts/center_mouse.sh"
	)
)
