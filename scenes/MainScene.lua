
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    -- cc.ui.UILabel.new({
    --         UILabelType = 2, text = "Hello, World", size = 64})
    --     :align(display.CENTER, display.cx, display.cy)
    --     :addTo(self)
--创建精灵的三种方式：
-- 1.使用图片文件名创建

-- 原始方法创建Sprite
	local sp1 = cc.Sprite:create("bird.png")
	sp1:pos(200, 200)
	self:addChild(sp1)

-- display
	local spp =  display.newSprite("MainMenu.png")
	:pos(240, 160)
	:addTo(self,-1)

-- -- 2.从图片帧创建 
	display.addSpriteFrames("hourse_default.plist", "hourse_default.png")
	self._sp2 = display.newSprite("#1.png")
	self._sp2:setScale(.4)
	self._sp2:pos(100, 200)
	self:addChild(self._sp2)

-- -- 精灵帧动画
	local frames = display.newFrames("%d.png", 1, 7)
	local animation = display.newAnimation(frames, 0.08)
	self._sp2:playAnimationForever(animation)

local exp = cc.ProgressTimer:create(cc.Sprite:create("12.png"))
	exp:pos(106,107)
	exp:setScale(2)
	exp:setBarChangeRate(cc.p(2,0))
	exp:setType(display.PROGRESS_TIMER_BAR)
	exp:setMidpoint(cc.p(0,0.2))
	exp:setPercentage(0)
	self:add(exp)
	
	
end
function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
