local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local gears = require("gears")
local config = require("config")

-- modkeys
local main_modkey = config.binds.main_modkey
local second_modkey = config.binds.second_modkey

-- default programs
local terminal = config.apps.terminal

-- get max number of tags per screen
local function get_max_tags()
	local tags_per_screen = {}
	for i, v in ipairs(config.tags) do
		if tags_per_screen[v.screen] == nil then tags_per_screen[v.screen] = 0 end -- initialize table values if needed
		tags_per_screen[v.screen] = tags_per_screen[v.screen] + 1 -- increment by one
	end

	return math.max(table.unpack(tags_per_screen))
end


local globalkeys = gears.table.join(
	-- commands for awesome
	awful.key({main_modkey}, "h", hotkeys_popup.show_help,
		{description="show help", group="awesome"}),
	awful.key({"Mod1"}, "Delete", awesome.restart,
		{description="reload awesome", group="awesome"}),
	awful.key({"Control","Mod1"}, "Delete", awesome.quit,
		{description="quit awesome", group="awesome"}),	
	
	-- tab navigation
	awful.key({main_modkey}, "Left", awful.tag.viewprev,
		{description="view previous", group="tag"}),
	awful.key({main_modkey}, "Right", awful.tag.viewnext,
		{description="view next", group="tag"}),

	-- programs
	awful.key({main_modkey}, "Return", function () awful.spawn(terminal) end,
		{description="launch a terminal", group="programs"}),
	awful.key({main_modkey,second_modkey}, "Return", function () awful.screen.focused().promptbox:run() end,
		{description="launch a program", group="programs"})
)
	
local clientkeys = gears.table.join(
	-- windows
	awful.key({main_modkey,second_modkey}, "Down", function (c) c:kill() end,
		{description="close", group="window"}),
	awful.key({main_modkey}, "Up",
		function (c)
			c.maximized = not c.maximized
			c:raise()
		end,
		{description="(un)maximize", group="window"}),
	awful.key({main_modkey}, "Down",
		function (c)
			c.minimized = true
		end,
		{description="minimize", group="window"}),
	awful.key({main_modkey,second_modkey}, "Left",
		function (c)
			local current_tag = c.first_tag
			if current_tag then
				local future_tag_index = current_tag.index - 1
				if future_tag_index < 1 then
					future_tag_index = #config.tags
				end
				c:move_to_tag(awful.screen.focused().tags[future_tag_index])
				c:jump_to(false) -- false to not merge tags
			end
		end,
		{description="move left", group="window"}),
	awful.key({main_modkey,second_modkey}, "Right",
		function (c)
			local current_tag = c.first_tag
			if current_tag then
				local future_tag_index = current_tag.index+1
				if future_tag_index > #config.tags then
					future_tag_index = 1
				end
				c:move_to_tag(awful.screen.focused().tags[future_tag_index])
				c:jump_to(false) -- false to not merge tags
			end
		end,
		{description="move right", group="window"})
)

for i = 1, get_max_tags() do
	globalkeys = gears.table.join(globalkeys,
		awful.key({main_modkey}, "#" .. i + 9,
			function ()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			{description = "view tag "..i, group="tag"}),
		awful.key({main_modkey,second_modkey}, "#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			{description = "move to tag  "..i, group="window"})
	)
end

local clientbuttons = { }

local tasklist_buttons = gears.table.join(
	awful.button({ }, 1, function (c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", {raise = true})
		end
	end)
)

local bindings = {
	globalkeys = globalkeys,
	clientkeys = clientkeys,
	clientbuttons = clientbuttons,
	tasklistbuttons = tasklist_buttons
}

return bindings
