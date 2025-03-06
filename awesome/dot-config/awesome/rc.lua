-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")

-- config info
local config = require("config")

-- load the theme
beautiful.init(config.theme)

--load core modules
require("core.error")
require("core.screens")
-- require("core.bindings") -- called in core.rules
require("core.rules")
require("core.signals")
