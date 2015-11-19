--
-- Author: hantianwang
-- Date: 2015-11-02 16:00:27
--
local ScheduleScene = class("ScheduleScene",function (  )

	return display.newScene("ScheduleScene")

end)
function ScheduleScene:ctor()
	--时间调度 方式一
	local sharedScheduler = cc.Director:getInstance():getScheduler();
	sharedScheduler:scheduleScriptFunc(function()
		print("执行")
		end,1,false)
	--quick封装 方式2
	--local scheduler=require(cc.PACKAGE_NAME..".schedule")
end

function ScheduleScene:onEnter()
end

function ScheduleScene:onExit()
end

return ScheduleScene