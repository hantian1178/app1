--
-- Author: hantianwang
-- Date: 2015-11-02 14:32:55
--
local ActionsScene = class("ActionsScene",function (  )

	return display.newScene("ActionsScene")

end)
function ActionsScene:ctor(  )
	-- 添加bird精灵
	self.birdSprite=display.newSprite("bird.png")
	self.birdSprite:pos(50, 160)
	self:addChild(self.birdSprite)
	-- 添加btn
	local btn = cc.ui.UIPushButton.new({normal="newgameA.png",pressed="newgameB.png"})
	btn:onButtonClicked(function ( event )
		--创建动作 并执行
		-- local _moveTo = cc.MoveTo:create(3,cc.p(400,160))
		-- self.birdSprite:runAction(_moveTo)

		--使用quick封装的transition来执行一个动作
		--transition.moveTo(self.birdSprite,{time=2,x=400,y=160})
		
		transition.execute(self.birdSprite,cc.MoveTo:create(3, cc.p(400,160)),
		{
			delay=2.0,
			easing="bounceIn",
			onComplete=function (  )
			transition.moveTo(self.birdSprite,
			{time=3,x=50,y=160})
			end		
		}
		)

	end)
	btn:pos(240, 50)
	self:addChild(btn)


end


function ActionsScene:onEnter()
end

function ActionsScene:onExit()
end

return ActionsScene