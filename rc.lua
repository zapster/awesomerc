-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")

-- Load Debian menu entries
require("debian.menu")

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/usr/share/awesome/themes/default/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
altkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
--    awful.layout.suit.floating,
    awful.layout.suit.tile,
--    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
--    awful.layout.suit.tile.top,
--    awful.layout.suit.fair,
--    awful.layout.suit.fair.horizontal,
--    awful.layout.suit.spiral,
--    awful.layout.suit.spiral.dwindle,
--    awful.layout.suit.max,
--    awful.layout.suit.max.fullscreen,
--    awful.layout.suit.magnifier
    awful.layout.suit.max
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
main_screen = 1
status_screen = 1

if screen.count() == 1 then
  -- single monitor stuff
  tags = {
    names = { "main", "mail", "im", "chat", "music", "gimp", 7, 8, 9, "thg", "eclipse", "graal", "igv", "c1vis", "F12"},
  }
  -- Each screen has its own tag table.
  tags[1] = awful.tag(tags.names, 1, layouts[1])
  tags.gimp = tags[main_screen][6]
else
  main_screen = 2
  status_screen = 1

  if screen[1].workarea.width > screen[2].workarea.width then
    main_screen = 1
    status_screen = 2
  end
  -- multi monitor stuff
  tags = {}
  -- set "status" screen
  tags[status_screen] = awful.tag({ 1, "mail", "im", "chat", "music", 6, 7, 8, 9 }, status_screen, layouts[1])
  -- set "main" screen
  tags[main_screen] = awful.tag({ "main", 2, 3, 4, 5, 6, 7, 8, "gimp", "thg", "eclipse", "graal", "igv", "c1vis", "F12" }, main_screen, layouts[1])
  for s = 3, screen.count() do
      -- Each screen has its own tag table.
      tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
  end
  tags.gimp = tags[main_screen][9]
end

tags.main = tags[main_screen][1]
tags.mail = tags[status_screen][2]
tags.im = tags[status_screen][3]
tags.chat = tags[status_screen][4]
tags.music = tags[status_screen][5]
tags.thg = tags[main_screen][10]
tags.eclipse = tags[main_screen][11]
tags.graal = tags[main_screen][12]
tags.igv = tags[main_screen][13]
tags.c1vis = tags[main_screen][14]
tags.F12 = tags[main_screen][15]
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
--myawesomemenu = {
--   { "manual", terminal .. " -e man awesome" },
--   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
--   { "restart", awesome.restart },
--   { "quit", awesome.quit }
--}
--
--mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
--                                    { "Debian", debian.menu.Debian_menu.Debian },
--                                   { "open terminal", terminal }
--                                  }
--                        })
--
--mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
--                                     menu = mymainmenu })
-- }}}

-- {{{ freedesktop menu stuff
-- applications menu
  require('freedesktop.utils')
  freedesktop.utils.terminal = terminal  -- default: "xterm"
  freedesktop.utils.icon_theme = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)
  require('freedesktop.menu')
  require("debian.menu")

  menu_items = freedesktop.menu.new()
  myawesomemenu = {
     { "manual", terminal .. " -e man awesome", freedesktop.utils.lookup_icon({ icon = 'help' }) },
     { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua", freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
     { "restart", awesome.restart, freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
     { "quit", awesome.quit, freedesktop.utils.lookup_icon({ icon = 'gtk-quit' }) }
  }
  table.insert(menu_items, { "awesome", myawesomemenu, beautiful.awesome_icon })
  table.insert(menu_items, { "open terminal", terminal, freedesktop.utils.lookup_icon({icon = 'terminal'}) })
  table.insert(menu_items, { "Debian", debian.menu.Debian_menu.Debian, freedesktop.utils.lookup_icon({ icon = 'debian-logo' }) })

  mybrowsermenu = {
    { "firefox default", "firefox -P default -no-remote", freedesktop.utils.lookup_icon({ icon = 'firefox' })  },
    { "firefox JKU", "firefox -P JKU -no-remote", freedesktop.utils.lookup_icon({ icon = 'firefox' })  },
    { "firefox uni", "firefox -P uni -no-remote", freedesktop.utils.lookup_icon({ icon = 'firefox' })  },
    { "firefox epicopt", "firefox -P epicopt -no-remote", freedesktop.utils.lookup_icon({ icon = 'firefox' })  },
    { "firefox stonepinecircle", "firefox -P stonepinecircle -no-remote", freedesktop.utils.lookup_icon({ icon = 'firefox' })  },
  }
  mymailmenu = {
    { "thunderbird default", "thunderbird -P default -no-remote", freedesktop.utils.lookup_icon({ icon = 'thunderbird' })  },
    { "thunderbird JKU", "thunderbird -P JKU -no-remote", freedesktop.utils.lookup_icon({ icon = 'thunderbird' })  },
  }

  table.insert(menu_items, { "E-Mail", mymailmenu, freedesktop.utils.lookup_icon({ icon = 'thunderbird' }) })
  table.insert(menu_items, { "Browser", mybrowsermenu, freedesktop.utils.lookup_icon({ icon = 'firefox' }) })

  local mypanel = {}
  mypanel.menu_dirs = {"/home/zapster/.gnome2/panel2.d/default/launchers"}
  mypanelmenu = freedesktop.menu.new(mypanel)

  table.insert(menu_items, { "Panel", mypanelmenu, freedesktop.utils.lookup_icon({ icon = 'gtk-paste' }) })

  mymainmenu = awful.menu.new({ items = menu_items, width = 150 })

  mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })


  -- desktop icons
--  require('freedesktop.desktop')
--  for s = 1, screen.count() do
--        freedesktop.desktop.add_applications_icons({screen = s, showlabels = true})
--        freedesktop.desktop.add_dirs_and_files_icons({screen = s, showlabels = true})
--  end
-- }}}

-- set the desired pixel coordinates:
local safeCoords = {x=0, y=0}
-- Flag to tell Awesome whether to do this at startup.
local moveMouseOnStartup = true

-- Simple function to move the mouse to the coordinates set above.
local function moveMouse(x_co, y_co)
    mouse.coords({ x=x_co, y=y_co })
end

--   this is useful if you needed the mouse for something and now want it out of the way

-- Optionally move the mouse when rc.lua is read (startup)
if moveMouseOnStartup then
    moveMouse(safeCoords.x, safeCoords.y)
end

-- {{{ Vicious Widgets

require("vicious")

-- CPU usage widget
cpuwidget = awful.widget.graph()
cpuwidget:set_width(50)
cpuwidget:set_height(30)
cpuwidget:set_background_color("#494B4F")
cpuwidget:set_color("#FF5656")
cpuwidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

cpuwidget_t = awful.tooltip({ objects = { cpuwidget.widget },})

-- Register CPU widget
vicious.register(cpuwidget, vicious.widgets.cpu,
                    function (widget, args)
                        cpuwidget_t:set_text("CPU Usage: " .. args[1] .. "%")
                        return args[1]
                    end)

-- Initialize widget
mpdwidget = widget({ type = "textbox" })
-- Register widget
vicious.register(mpdwidget, vicious.widgets.mpd,
    function (widget, args)
        if args["{state}"] == "Stop" then
            return " - "
        else
            return args["{Artist}"]..' - '.. args["{Title}"]
        end
    end, 10)

-- }}}

-- {{{ Wibox

spacer = widget({type = "textbox"})
separator = widget({type = "textbox"})
spacer.text = " "
separator.text = "|"

-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    local status_widgets = nil
    if s == status_screen then
      status_widgets = {
          cpuwidget.widget,
          spacer,
          separator,
          spacer,

          mpdwidget.widget,
          spacer,
          separator,
          spacer,

          layout = awful.widget.layout.horizontal.rightleft
        }
    end

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        spacer,

        mytextclock,
        spacer,

        s == main_screen and mysystray or nil,
        s == main_screen and spacer or nil,

        status_widgets,

        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    -- BEGIN Zap specific
    awful.key({ "Control", altkey }, "Left",   awful.tag.viewprev       ),
    awful.key({ "Control", altkey }, "Right",  awful.tag.viewnext       ),
    -- END Zap specific
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    -- BEGIN Zap specific
    awful.key({ altkey,           }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ altkey, "Shift"   }, "Tab",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    -- END Zap specific
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    -- Bind ''Meta4+Ctrl+m'' to move the mouse to the coordinates set above.
    awful.key({ modkey, "Control"   }, "m", function () moveMouse(safeCoords.x, safeCoords.y) end),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    -- BEGIN Zap specific
    --awful.key({ altkey,           }, "F4",     function (c) c:kill()                         end),
    -- END Zap specific
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Bind F# keys to the special purpose tags
globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey }, "F1",
        function ()
            awful.tag.viewonly(tags.main);
            awful.screen.focus(tags.main.screen)
        end),
    awful.key({ modkey }, "F2",
        function ()
            awful.tag.viewonly(tags.mail);
            awful.screen.focus(tags.mail.screen)
        end),
    awful.key({ modkey }, "F3",
        function ()
            awful.tag.viewonly(tags.im);
            awful.screen.focus(tags.im.screen)
        end),
    awful.key({ modkey }, "F4",
        function ()
            awful.tag.viewonly(tags.chat);
            awful.screen.focus(tags.chat.screen)
        end),
    awful.key({ modkey }, "F5",
        function ()
            awful.tag.viewonly(tags.music);
            awful.screen.focus(tags.music.screen)
        end),
    awful.key({ modkey }, "F6",
        function ()
            awful.tag.viewonly(tags.gimp);
            awful.screen.focus(tags.gimp.screen)
        end),
    -- work related
    awful.key({ modkey }, "F7",
        function ()
            awful.tag.viewonly(tags.thg);
            awful.screen.focus(tags.thg.screen)
        end),
    awful.key({ modkey }, "F8",
        function ()
            awful.tag.viewonly(tags.eclipse);
            awful.screen.focus(tags.eclipse.screen)
        end),
    awful.key({ modkey }, "F9",
        function ()
            awful.tag.viewonly(tags.graal);
            awful.screen.focus(tags.graal.screen)
        end),
    awful.key({ modkey }, "F10",
        function ()
            awful.tag.viewonly(tags.igv);
            awful.screen.focus(tags.igv.screen)
        end),
    awful.key({ modkey }, "F11",
        function ()
            awful.tag.viewonly(tags.c1vis);
            awful.screen.focus(tags.c1vis.screen)
        end),
    awful.key({ modkey }, "F12",
        function ()
            awful.tag.viewonly(tags.F12);
            awful.screen.focus(tags.F12.screen)
        end),
    awful.key({ modkey, "Shift" }, "F7",
        function ()
            awful.client.movetotag(tags.thg);
        end),
    awful.key({ modkey, "Shift" }, "F8",
        function ()
            awful.client.movetotag(tags.eclipse);
        end),
    awful.key({ modkey, "Shift" }, "F9",
        function ()
            awful.client.movetotag(tags.graal);
        end),
    awful.key({ modkey, "Shift" }, "F10",
        function ()
            awful.client.movetotag(tags.igv);
        end),
    awful.key({ modkey, "Shift" }, "F11",
        function ()
            awful.client.movetotag(tags.c1vis);
        end),
    awful.key({ modkey, "Shift" }, "F12",
        function ()
            awful.client.movetotag(tags.F12);
        end),
    -- move clients to screen
    awful.key({ modkey, "Shift" }, "F1",
        function ()
            awful.client.movetotag(tags.main);
        end),
    awful.key({ modkey, "Shift" }, "F2",
        function ()
            awful.client.movetotag(tags.mail);
        end),
    awful.key({ modkey, "Shift" }, "F3",
        function ()
            awful.client.movetotag(tags.im);
        end),
    awful.key({ modkey, "Shift" }, "F4",
        function ()
            awful.client.movetotag(tags.chat);
        end),
    awful.key({ modkey, "Shift" }, "F5",
        function ()
            awful.client.movetotag(tags.music);
        end),
    awful.key({ modkey, "Shift" }, "F6",
        function ()
            awful.client.movetotag(tags.gimp);
        end)
)
-- Bind CTRL+ALT L to lock screen
globalkeys = awful.util.table.join(globalkeys,
    awful.key({ "Control", "Mod1" }, "l",
        function ()
            awful.util.spawn("xscreensaver-command -lock")
        end)
)
-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    -- Gimp tuning
    { rule = { class = "Gimp" },
      properties = { floating = false, tag = tags.gimp },
      callback = awful.client.setslave },
      -- main window
    { rule = { class = "Gimp", role = "gimp-image-window" },
      properties = { },
      callback = awful.client.setmaster },
      -- toolbox
    --{ rule = { class = "Gimp", role = "gimp-toolbox" },
    --  properties = { },
    --  callback = awful.client.setslave },
      -- dock (e.g. layers)
    --{ rule = { class = "Gimp", role = "gimp-dock" },
    --  properties = { },
    --  callback = awful.client.setslave },
    -- set IM's to im tag
    { rule = { class = "Pidgin" },
      properties = { tag = tags.im } },
    { rule = { class = "Skype" },
      properties = { tag = tags.im } },
    { rule = { class = "Empathy" },
      properties = { tag = tags.im } },
      -- class Empathy problem -> workaround
    { rule = { role = "contact_list" },
      properties = { tag = tags.im } },
    { rule = { role = "chat" },
      properties = { tag = tags.im } },
    -- email
    { rule = { class = "Thunderbird" },
      properties = { tag = tags.mail } },
    -- chat
    { rule = { class= "Terminator", role = "irc" },
      properties = { tag = tags.chat } },
    -- music
    { rule = { class = "Gmpc" },
      properties = { tag = tags.music } },
    -- nvidia settings
    { rule = { class = "Nvidia-settings" },
      properties = { floating = false, tag = tags.main } },
    -- flash fullscreen settings
    { rule = { class = "Plugin-container" },
      properties = { fullscreen = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
    -- work
    { rule = { class = "Thg" },
      properties = { tag = tags.thg } },
    { rule = { class = "Eclipse" },
      properties = { tag = tags.eclipse } },
    { rule = { class = "IdealGraphVisualizer" },
      properties = { tag = tags.igv } },
    { rule = { class = "Java HotSpot Client Compiler Visualizer" },
      properties = { tag = tags.c1vis } },
    { rule = { name = "Eclipse" },
      properties = { tag = tags.eclipse } },
    { rule = { name = "Starting IdealGraphVisualizer" },
      properties = { tag = tags.igv } },
    { rule = { name = "Starting Java HotSpot Client Compiler Visualizer" },
      properties = { tag = tags.c1vis } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

awful.util.spawn_with_shell("/home/zapster/usr/local/bin/dex -a -e awesome")
--awful.util.spawn("nm-applet &")
