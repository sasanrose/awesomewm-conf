 function activeram()
    local active, total
    for line in io.lines('/proc/meminfo') do
        for key, value in string.gmatch(line, "(%w+):\ +(%d+).+") do
            if key == "Active" then active = tonumber(value)
            elseif key == "MemTotal" then total = tonumber(value) end
        end
    end
    
    return string.format(" | <span color='#7F9F7F'>Mem:</span> <span color='#CC9393'><b>%.0f%%</b></span> ",(active/total)*100)
 end

 meminfo = widget({ type = "textbox", align = "right" })

 awful.hooks.timer.register(10, function() meminfo.text = activeram() end)
