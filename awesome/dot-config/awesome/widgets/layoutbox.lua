local awful = require("awful")
local gears = require("gears")

-- table of layouts to use with awful.layout.inc
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.max,
	awful.layout.suit.floating,
}

-- function for initializing layoutbox
local layoutbox = {}

function layoutbox.layoutbox(s)
	local mylayoutbox = awful.widget.layoutbox(s)
	mylayoutbox:buttons(gears.table.join(
		awful.button({ }, 1, function () awful.layout.inc( 1) end),
		awful.button({ }, 3, function () awful.layout.inc(-1) end),
		awful.button({ }, 4, function () awful.layout.inc( 1) end),
		awful.button({ }, 5, function () awful.layout.inc(-1) end)
	))

	return mylayoutbox
end

return layoutbox
