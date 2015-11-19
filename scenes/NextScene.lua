--
-- Author: hantianwang
-- Date: 2015-11-02 16:19:08
--
local NextScene = class("NextScene",function (  )

	return display.newScene("NextScene")

end)
function NextScene:ctor()
	print("NextScene")
	local btn = cc.ui.UIPushButton.new({normal="newgameA.png",pressed="newgameB.png"})
	btn:onButtonClicked(function(event)
		--切换场景
		local scene=require("app.scenes.MainScene")
		--display.replaceScene(scene:new())
		--包装过度效果
	local transition = display.wrapSceneWithTransition(scene:new(),"splitCols",0.2)
	display.replaceScene(transition)
	end)
	btn:pos(240, 50)
	self:add(btn)
end

function NextScene:onEnter()
end

function NextScene:onExit()
end

return NextScene