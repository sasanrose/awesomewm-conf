require("vicious")
netwidget = widget({ type = "textbox" })
vicious.register(netwidget, vicious.widgets.net, ' <span color="#7F9F7F">D:</span><span color="#CC9393"><b>${wlan3 down_kb}</b></span> <span color="#7F9F7F">U:</span><span color="#CC9393"><b>${wlan3 up_kb}</b></span> ', 3)
