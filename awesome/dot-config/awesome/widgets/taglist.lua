local awful = require("awful")
local gears = require("gears")

local taglist_buttons = gears.table.join(
	awful.button({ }, 1, function(t) t:view_only() end)
)

local mytaglist = { }

function mytaglist.taglist(s)
	local taglist = awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons
	}

	return taglist
end

return mytaglist
