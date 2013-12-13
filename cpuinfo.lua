   jiffies = {}
   function activecpu()
       local s = ""
       for line in io.lines("/proc/stat") do
           local cpu, newjiffies = string.match(line, "(cpu%d*)\ +(%d+)")
           if cpu and newjiffies then
               if not jiffies[cpu] then
                   jiffies[cpu] = newjiffies
               end
               --The string.format prevents your task list from jumping around 
               --when CPU usage goes above/below 10%
               s = s .. " " .. string.format("<span color='#CC9393'><b>%02d", newjiffies-jiffies[cpu]) .. "%</b></span> "
               jiffies[cpu] = newjiffies
           end
       end
       s = " | <span color='#7F9F7F'>CPU:</span> " .. s
       return s
   end
   cpuinfo = widget({ type = "textbox", align = "right" })
   awful.hooks.timer.register(1, function() cpuinfo.text = activecpu() end)
