local awful = require("awful")
local wibox = require("wibox")

local bindings = require("core.bindings")
local config = require("config")

local deficient = require("widgets.deficient")

-- widgets
local menu_launcher = require("widgets.menu")
local layoutbox_widget = require("widgets.layoutbox")
local taglist_widget = require("widgets.taglist")
local lowercase_textclock = require("widgets.lowercase_textclock")
local volume_widget = deficient.volume_control {
	listen = true,
	timeout = 1.5,
	lclick = "toggle",
	mclick = "pwvucontrol",
	rclick = "pwvucontrol",
	widget_text = {
		on  = 'vol:% 3d%%',        -- three digits, fill with leading spaces
		off = 'mut:% 3d%%',
	},
}

awful.screen.connect_for_each_screen(function(s)
	-- tags
	-- make sure to set proper amount of tags in bindings.lua
	for i, tag in pairs(config.tags) do
		if s.index == tag.screen then 
			awful.tag.add(tag.name, {
				layout = tag.layout,
				screen = s,
			})
		end
	end

    s.tags[1]:view_only()

	s.promptbox = awful.widget.prompt()
	s.layoutbox = layoutbox_widget.layoutbox(s)
	s.taglist = taglist_widget.taglist(s)
	s.tasklist = awful.widget.tasklist {
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = bindings.tasklistbuttons
	}

	-- add all the widgets to this bitch...
	s.widgetbox = awful.wibar({ position = "top", screen = s})

	s.widgetbox:setup {
		layout = wibox.layout.align.horizontal,
		-- left widgets
		{
			layout = wibox.layout.fixed.horizontal,
			-- menu_launcher,
			s.taglist,
			s.promptbox,
		},
		
		-- middle widget
		s.tasklist,
		
		-- right widgets
		{ 
			layout = wibox.layout.fixed.horizontal,
			spacing = 10,
			-- spacing_widget = wibox.widget.separator,
			wibox.widget.systray(),
			volume_widget,
			lowercase_textclock("%b. %-d, %-I:%M %p"),
			s.layoutbox,
		},
	}
end)
