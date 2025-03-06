local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- signal function to execute when a new client appears
client.connect_signal("manage", function (c)
	if awesome.startup
		and not c.size_hints.user_position
		and not c.size_hints.program_position then
			awful.placement.no_offscreen(c)
	end
end)

-- add a titlebar depending on the rules
client.connect_signal("request::titlebars", function(c)
	local buttons = gears.table.join(
		awful.button({ }, 1, function ()
			c:emit_signal("request::activate", "titlebar", {raise = true})
			awful.mouse.client.move(c)
		end),
		awful.button({ }, 3, function ()
			c:emit_signal("request::activate", "titlebar", {raise = true})
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c) : setup {
		-- left buttons
		{
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.flex.horizontal
		},
		-- middle
		{
			-- title
			{
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c)
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal
		},
		-- right
		{
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.flex.horizontal()
		},
		layout = wibox.layout.align.horizontal
	}
end)

client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
