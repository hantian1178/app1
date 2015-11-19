--
-- Author: hantianwang
-- Date: 2015-11-02 15:45:02
--
local TouchScene = class("TouchScene",function (  )

	return display.newScene("TouchScene")

end)
function TouchScene:ctor(  )

	--local btn = cc.ui.UIPushButton.new({normal="btn-about-normal.png",pressed="btn-about-selected.png"})
	--btn:onButtonClicked(function(event) 
		
	-- 添加bird精灵
	self.birdSprite=display.newSprite("bird.png")
	self.birdSprite:pos(50, 160)
	self:addChild(self.birdSprite)

	--end)
	--btn:pos(100, 100)
	--self:add(btn)
	
	
end

function TouchScene:onEnter()	
	self.birdSprite:setTouchEnabled(true)
	self.birdSprite:addNodeEventListener(cc.NODE_TOUCH_EVENT, function (event)
		dump(event)
		if event.name == "began" then
			print("开始")

			 transition.scaleTo(self.birdSprite, {scale=2,time=2})
			return true
		elseif event.name == "ended" then
			print("结束")
			transition.scaleTo(self.birdSprite, {scale=0.5,time=2})
		end
	end)
	
end

function TouchScene:onExit()
end

return TouchScene