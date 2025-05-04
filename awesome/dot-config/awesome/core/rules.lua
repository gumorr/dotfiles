local awful = require("awful")
local beautiful = require("beautiful")

local bindings = require("core.bindings")

root.keys(bindings.globalkeys)

awful.rules.rules = {
	-- default rules
	{ rule = { }, properties = {
		border_width = beautiful.border_width,
		border_color = beautiful.border_normal,
		focus = awful.client.focus.filter,
		raise = true,
		keys = bindings.clientkeys,
		buttons = bindings.clientbuttons,
		screen = awful.screen.preferred,
		placement = awful.placement.no_overlap+awful.placement.no_offscreen
	}},

	-- add titlebars to normal windows
	{ rule_any = {type = { "normal", "dialog" }},
		properties = { titlebars_enabled = true }
	},


	-- set firefox to always map on "web" tag, and make sure only browser windows are tiled
	{ rule = { class = "firefox" },
		properties = { screen = 1, tag = "web" }
	},

	{ rule = { class = "firefox" },
		except = { role = "browser" },
		properties = { floating = true },
	},


	-- vesktop only opens in chat
	{ rule_any = { class = { "discord", "vesktop" } },
		properties = { screen = 2, tag = "chat" }
	},


	-- steam only opens in game, all steam windows except main one are floating
	{ rule_any = { class = { "steam", "steamwebhelper" } },
		properties = { screen = 1, tag = "game" }
	},

	{ rule_any = { class = { "steam", "steamwebhelper" } },
		except = { name = "Steam" },
		properties = { floating = true }
	},

}
