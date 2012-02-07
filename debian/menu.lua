-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_Applications_Accessibility"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Applications_Editors"] = {
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"GHex","/usr/bin/ghex2"},
	{"GVIM","/usr/bin/vim.gnome -g -f","/usr/share/pixmaps/vim-32.xpm"},
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"Xedit","xedit"},
}
Debian_menu["Debian_Applications_Emulators"] = {
	{"SPIM", "x-terminal-emulator -e ".."/usr/bin/spim"},
	{"VirtualBox OSE","/usr/bin/virtualbox","/usr/share/pixmaps/virtualbox-ose.xpm"},
	{"XSPIM","/usr/bin/xspim"},
}
Debian_menu["Debian_Applications_File_Management"] = {
	{"Baobab","/usr/bin/baobab","/usr/share/pixmaps/baobab.xpm"},
	{"Brasero","/usr/bin/brasero"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"GNOME Search Tool","/usr/bin/gnome-search-tool","/usr/share/pixmaps/gsearchtool.xpm"},
	{"mc", "x-terminal-emulator -e ".."/usr/bin/mc","/usr/share/pixmaps/mc.xpm"},
	{"Nautilus","/usr/bin/nautilus","/usr/share/pixmaps/nautilus.xpm"},
}
Debian_menu["Debian_Applications_Graphics"] = {
	{"avidemux","/usr/bin/avidemux2_gtk","/usr/share/pixmaps/avidemux-gtk.xpm"},
	{"dotty","/usr/bin/dotty"},
	{"GNOME Screenshot Tool","/usr/bin/gnome-panel-screenshot"},
	{"gtk-recordmydesktop","/usr/bin/gtk-recordMyDesktop","/usr/share/pixmaps/gtk-recordmydesktop.xpm"},
	{"ImageMagick","/usr/bin/display logo:","/usr/share/pixmaps/display.xpm"},
	{"Inkscape","/usr/bin/inkscape","/usr/share/pixmaps/inkscape.xpm"},
	{"lefty","/usr/bin/lefty"},
	{"OpenOffice.org Draw","/usr/bin/oodraw","/usr/share/icons/hicolor/32x32/apps/openofficeorg3-draw.xpm"},
	{"phatch","/usr/bin/phatch"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Applications_Network_Communication"] = {
	{"Evolution","/usr/bin/evolution","/usr/share/pixmaps/evolution.xpm"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
	{"Terminal Server Client","/usr/bin/tsclient -f","/usr/share/pixmaps/tsclient.xpm"},
	{"Vinagre","vinagre"},
	{"Xbiff","xbiff"},
	{"X-Chat GNOME","/usr/bin/xchat-gnome"},
}
Debian_menu["Debian_Applications_Network_File_Transfer"] = {
	{"Deluge BitTorrent Client","/usr/bin/deluge","/usr/share/pixmaps/deluge.xpm"},
	{"FileZilla","/usr/bin/filezilla","/usr/share/pixmaps/filezilla.xpm"},
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Applications_Network_Monitoring"] = {
	{"WiFi Radar","su-to-root -X -c /usr/sbin/wifi-radar","/usr/share/pixmaps/wifi-radar.xpm"},
	{"Wireshark","/usr/bin/wireshark","/usr/share/pixmaps/wsicon32.xpm"},
}
Debian_menu["Debian_Applications_Network_Web_Browsing"] = {
	{"Firefox Browser","/usr/bin/firefox","/usr/share/pixmaps/firefox.xpm"},
	{"Google Chrome","/opt/google/chrome/google-chrome","/opt/google/chrome/product_logo_32.xpm"},
	{"Lynx-cur", "x-terminal-emulator -e ".."lynx"},
	{"w3m", "x-terminal-emulator -e ".."/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"},
}
Debian_menu["Debian_Applications_Network"] = {
	{ "Communication", Debian_menu["Debian_Applications_Network_Communication"] },
	{ "File Transfer", Debian_menu["Debian_Applications_Network_File_Transfer"] },
	{ "Monitoring", Debian_menu["Debian_Applications_Network_Monitoring"] },
	{ "Web Browsing", Debian_menu["Debian_Applications_Network_Web_Browsing"] },
}
Debian_menu["Debian_Applications_Office"] = {
	{"LyX Document Processor","lyx","/usr/share/pixmaps/lyx-32x32.xpm"},
	{"OpenOffice.org Calc","/usr/bin/oocalc","/usr/share/icons/hicolor/32x32/apps/openofficeorg3-calc.xpm"},
	{"OpenOffice.org Impress","/usr/bin/ooimpress","/usr/share/icons/hicolor/32x32/apps/openofficeorg3-impress.xpm"},
	{"OpenOffice.org Writer","/usr/bin/oowriter","/usr/share/icons/hicolor/32x32/apps/openofficeorg3-writer.xpm"},
	{"pdfshuffler","/usr/bin/pdfshuffler"},
}
Debian_menu["Debian_Applications_Programming"] = {
	{"codeblocks","/usr/bin/codeblocks"},
	{"DevHelp","/usr/bin/devhelp","/usr/share/pixmaps/devhelp-debian.xpm"},
	{"Eclipse","eclipse"},
	{"Erlang Shell", "x-terminal-emulator -e ".."/usr/bin/erl","/usr/share/pixmaps/erlang.xpm"},
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
	{"Hugs", "x-terminal-emulator -e ".."/usr/bin/hugs"},
	{"IDLE (Python IDE)","/usr/bin/idle -n","/usr/share/pixmaps/idle.xpm"},
	{"IDLE (Python v2.6)","/usr/bin/idle-python2.6 -n","/usr/share/pixmaps/python2.6.xpm"},
	{"Kiki","/usr/bin/kiki","/usr/share/pixmaps/kiki.xpm"},
	{"Meld","/usr/bin/meld"},
	{"Nemiver","/usr/bin/nemiver","/usr/share/pixmaps/nemiver.xpm"},
	{"Python (v2.6)", "x-terminal-emulator -e ".."/usr/bin/python2.6","/usr/share/pixmaps/python2.6.xpm"},
	{"Python (v2.7)", "x-terminal-emulator -e ".."/usr/bin/python2.7","/usr/share/pixmaps/python2.7.xpm"},
	{"Python (v3.1)", "x-terminal-emulator -e ".."/usr/bin/python3.1","/usr/share/pixmaps/python3.1.xpm"},
	{"SPE","/usr/bin/spe","/usr/share/pixmaps/spe.xpm"},
	{"Tclsh8.4", "x-terminal-emulator -e ".."/usr/bin/tclsh8.4"},
	{"Tclsh8.5", "x-terminal-emulator -e ".."/usr/bin/tclsh8.5"},
	{"TkWish8.4","x-terminal-emulator -e /usr/bin/wish8.4"},
	{"TkWish8.5","x-terminal-emulator -e /usr/bin/wish8.5"},
	{"winpdb","/usr/bin/winpdb","/usr/share/pixmaps/winpdb.xpm"},
	{"WxGlade","/usr/bin/wxglade"},
}
Debian_menu["Debian_Applications_Science_Data_Analysis"] = {
	{"GNU R", "x-terminal-emulator -e ".."/usr/bin/R"},
}
Debian_menu["Debian_Applications_Science_Engineering"] = {
	{"varkon","/usr/bin/varkon","/usr/share/pixmaps/varkon.xpm"},
}
Debian_menu["Debian_Applications_Science_Mathematics"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"GCalcTool","/usr/bin/gcalctool","/usr/share/pixmaps/gcalctool.xpm"},
	{"Gnuplot", "x-terminal-emulator -e ".."/usr/bin/gnuplot"},
	{"OpenOffice.org Math","/usr/bin/oomath","/usr/share/icons/hicolor/32x32/apps/openofficeorg3-math.xpm"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Applications_Science"] = {
	{ "Data Analysis", Debian_menu["Debian_Applications_Science_Data_Analysis"] },
	{ "Engineering", Debian_menu["Debian_Applications_Science_Engineering"] },
	{ "Mathematics", Debian_menu["Debian_Applications_Science_Mathematics"] },
}
Debian_menu["Debian_Applications_Shells"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Csh", "x-terminal-emulator -e ".."/bin/bsd-csh -l"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
}
Debian_menu["Debian_Applications_Sound"] = {
	{"Audacity","/usr/bin/audacity","/usr/share/pixmaps/audacity32.xpm"},
	{"Ex Falso","/usr/bin/exfalso"},
	{"gmix (Gnome 2.0 Mixer)","/usr/bin/gnome-volume-control","/usr/share/pixmaps/gnome-mixer.xpm"},
	{"gmpc","/usr/bin/gmpc","/usr/share/pixmaps/gmpc.xpm"},
	{"grecord (GNOME 2.0 Recorder)","/usr/bin/gnome-sound-recorder","/usr/share/pixmaps/gnome-grecord.xpm"},
	{"gtick","/usr/bin/gtick","/usr/share/pixmaps/gtick_32x32.xpm"},
	{"Hydrogen","/usr/bin/hydrogen","/usr/share/pixmaps/h2-icon.xpm"},
	{"Rhythmbox","/usr/bin/rhythmbox","/usr/share/pixmaps/rhythmbox-small.xpm"},
	{"Sonata","/usr/bin/sonata","/usr/share/pixmaps/sonata.xpm"},
	{"TiMidity++","timidity -ia","/usr/share/pixmaps/timidity.xpm"},
}
Debian_menu["Debian_Applications_System_Administration"] = {
	{"DSL/PPPoE configuration tool", "x-terminal-emulator -e ".."/usr/sbin/pppoeconf","/usr/share/pixmaps/pppoeconf.xpm"},
	{"Editres","editres"},
	{"Gnome Control Center","/usr/bin/gnome-control-center","/usr/share/pixmaps/control-center2.xpm"},
	{"GNOME Network Tool","/usr/bin/gnome-nettool","/usr/share/pixmaps/gnome-nettool.xpm"},
	{"OpenJDK Java 6 Console","/usr/lib/jvm/java-6-openjdk/bin/jconsole","/usr/share/pixmaps/openjdk-6.xpm"},
	{"OpenJDK Java 6 Policy Tool","/usr/lib/jvm/java-6-openjdk/bin/policytool","/usr/share/pixmaps/openjdk-6.xpm"},
	{"pppconfig", "x-terminal-emulator -e ".."su-to-root -p root -c /usr/sbin/pppconfig"},
	{"Shares Admin","/usr/bin/shares-admin","/usr/share/gnome-system-tools/pixmaps/shares.xpm"},
	{"TeXconfig", "x-terminal-emulator -e ".."/usr/bin/texconfig"},
	{"Time Admin","/usr/bin/time-admin","/usr/share/gnome-system-tools/pixmaps/time.xpm"},
	{"User accounts Admin","/usr/bin/users-admin","/usr/share/gnome-system-tools/pixmaps/users.xpm"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Applications_System_Hardware"] = {
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Applications_System_Language_Environment"] = {
	{"Input Method Swicher", "x-terminal-emulator -e ".."/usr/bin/im-switch"},
}
Debian_menu["Debian_Applications_System_Monitoring"] = {
	{"Conky", "x-terminal-emulator -e ".."/usr/bin/conky"},
	{"GNOME Log Viewer","/usr/bin/gnome-system-log","/usr/share/pixmaps/gnome-system-log.xpm"},
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{"htop", "x-terminal-emulator -e ".."/usr/bin/htop"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Applications_System_Package_Management"] = {
	{"Synaptic Package Manager","/usr/bin/gksu /usr/sbin/synaptic","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Debian_menu["Debian_Applications_System_Security"] = {
	{"Seahorse","/usr/bin/seahorse","/usr/share/pixmaps/seahorse.xpm"},
}
Debian_menu["Debian_Applications_System"] = {
	{ "Administration", Debian_menu["Debian_Applications_System_Administration"] },
	{ "Hardware", Debian_menu["Debian_Applications_System_Hardware"] },
	{ "Language Environment", Debian_menu["Debian_Applications_System_Language_Environment"] },
	{ "Monitoring", Debian_menu["Debian_Applications_System_Monitoring"] },
	{ "Package Management", Debian_menu["Debian_Applications_System_Package_Management"] },
	{ "Security", Debian_menu["Debian_Applications_System_Security"] },
}
Debian_menu["Debian_Applications_Terminal_Emulators"] = {
	{"Gnome Terminal","/usr/bin/gnome-terminal","/usr/share/pixmaps/gnome-terminal.xpm"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Debian_menu["Debian_Applications_Text"] = {
	{"Character map","/usr/bin/gucharmap"},
	{"GNOME Dictionary","/usr/bin/gnome-dictionary","/usr/share/pixmaps/gdict.xpm"},
}
Debian_menu["Debian_Applications_Video"] = {
	{"DeVeDe","/usr/bin/devede","/usr/share/pixmaps/devede.xpm"},
	{"GNOME MPlayer","gnome-mplayer","/usr/share/pixmaps/gnome-mplayer.xpm"},
	{"Istanbul","/usr/bin/istanbul","/usr/share/pixmaps/istanbul.xpm"},
	{"Totem","/usr/bin/totem","/usr/share/pixmaps/totem.xpm"},
	{"VLC media player","/usr/bin/qvlc","/usr/share/icons/hicolor/32x32/apps/vlc.xpm"},
}
Debian_menu["Debian_Applications_Viewers"] = {
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"Shotwell","/usr/bin/shotwell"},
	{"Xditview","xditview"},
	{"XDvi","/usr/bin/xdvi"},
}
Debian_menu["Debian_Applications"] = {
	{ "Accessibility", Debian_menu["Debian_Applications_Accessibility"] },
	{ "Editors", Debian_menu["Debian_Applications_Editors"] },
	{ "Emulators", Debian_menu["Debian_Applications_Emulators"] },
	{ "File Management", Debian_menu["Debian_Applications_File_Management"] },
	{ "Graphics", Debian_menu["Debian_Applications_Graphics"] },
	{ "Network", Debian_menu["Debian_Applications_Network"] },
	{ "Office", Debian_menu["Debian_Applications_Office"] },
	{ "Programming", Debian_menu["Debian_Applications_Programming"] },
	{ "Science", Debian_menu["Debian_Applications_Science"] },
	{ "Shells", Debian_menu["Debian_Applications_Shells"] },
	{ "Sound", Debian_menu["Debian_Applications_Sound"] },
	{ "System", Debian_menu["Debian_Applications_System"] },
	{ "Terminal Emulators", Debian_menu["Debian_Applications_Terminal_Emulators"] },
	{ "Text", Debian_menu["Debian_Applications_Text"] },
	{ "Video", Debian_menu["Debian_Applications_Video"] },
	{ "Viewers", Debian_menu["Debian_Applications_Viewers"] },
}
Debian_menu["Debian_Games_Board"] = {
	{"Gnome Mahjongg","/usr/games/mahjongg","/usr/share/pixmaps/mahjongg.xpm"},
}
Debian_menu["Debian_Games_Card"] = {
	{"Gnome FreeCell","/usr/games/sol --variation freecell",},
	{"Gnome Solitaire Games","/usr/games/sol","/usr/share/pixmaps/aisleriot.xpm"},
}
Debian_menu["Debian_Games_Puzzles"] = {
	{"Gnome Sudoku","/usr/games/gnome-sudoku","/usr/share/pixmaps/gnome-sudoku.xpm"},
	{"Gnomine","/usr/games/gnomine","/usr/share/pixmaps/gnomine.xpm"},
	{"Quadrapassel","/usr/games/quadrapassel","/usr/share/pixmaps/quadrapassel.xpm"},
}
Debian_menu["Debian_Games_Toys"] = {
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Games"] = {
	{ "Board", Debian_menu["Debian_Games_Board"] },
	{ "Card", Debian_menu["Debian_Games_Card"] },
	{ "Puzzles", Debian_menu["Debian_Games_Puzzles"] },
	{ "Toys", Debian_menu["Debian_Games_Toys"] },
}
Debian_menu["Debian_Help"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"TeXdoctk","/usr/bin/texdoctk"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian"] = {
	{ "Applications", Debian_menu["Debian_Applications"] },
	{ "Games", Debian_menu["Debian_Games"] },
	{ "Help", Debian_menu["Debian_Help"] },
}
