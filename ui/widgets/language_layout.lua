local wibox = require("wibox")
local awful = require("awful")
    
local beautiful = require("beautiful")
    
kbdcfg = {}
kbdcfg.layout = { 
	{ "us", "" }, 
	{ "ru", "" } 
}
kbdcfg.cmd = "setxkbmap"
kbdcfg.current = 2 
kbdcfg.widget = wibox.widget {
    font = beautiful.icon_font_name .. "12",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox,
	markup = "<span foreground='" .. beautiful.xcolor12 .. "'>" ..
                               kbdcfg.layout[kbdcfg.current][1] .. "</span>"
}
kbdcfg.switch = function ()
    kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
    local t = kbdcfg.layout[kbdcfg.current]
    kbdcfg.widget:set_text(" " .. t[1] .. " ")
    os.execute( kbdcfg.cmd .. " " .. t[1] .. " " .. t[2] )
end

kbdcfg.switch()
return kbdcfg
