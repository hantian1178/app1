--
-- Author: hantianwang
-- Date: 2015-11-03 09:26:37
--
local UIScence = class("UIScence",function (  )

	return display.newScene("UIScence")

end)
function UIScence:ctor()
	self:testPushButton();
 	 --  self:testInput();
 	    --self:testCheckBox();
 	   --self:testCheckBoxGroup();

      --self:testScrollView();
 	  -- self:testListView(); --UITableView
 	   --self:testPageView();


	local slider = cc.ui.UISlider.new(display.LEFT_TO_RIGHT,{
		bar ="sliderProgress.png",
		button="sliderThumb.png"
		},{
		min=0,				--最小值
		max=100,			--最大值（可选 默认0-100）
		touchInButton=true  --是否只触摸在滑块上时才有效
		})
	--用户滑块监听
	slider:onSliderValueChanged(function ( event )
		printf("%.2d", event.value)
	end)
	slider:setSliderSize(250, 13);--设置slider大小
	slider:pos(115,300)
	self:add(slider);
	
end

function UIScence:testPushButton (  )
	local btn = cc.ui.UIPushButton.new({
		 	normal = "btn-play-normal.png",
		 	pressed = "btn-play-selected.png"
		})

	btn:onButtonClicked(function ( event )
		local scheduler = require(cc.PACKAGE_NAME .. ".scheduler")
		scheduler.scheduleGlobal(function ( )
		if self._slider:getSliderValue()>=100 then
			self._slider:setSliderValue(0)
		end
		self._slider:setSliderValue(self._slider:getSliderValue()+1)
		end,0,false)

	end)
	--用户按下监听
	btn:onButtonPressed(function ( event )
		print("按下")
	end)
	--用户释放监听
	btn:onButtonRelease(function (  )
		print("释放")
	end)
	 	btn:pos(display.cx, 40)
	 	self:add(btn)
	 

	-- local function onEdit( event,editbox )
	-- 	if event =="began" then
	-- 		print("开始输入")
	-- 		elseif event=="changed" then
	-- 			print("输入框内容发生变化")
	-- 		elseif event=="ended" then
	-- 			print("输入结束")
	-- 		elseif event=="return" then
	-- 			print("从输入框返回")
	-- 		end
	-- end 
	-- local input = cc.ui.UIInput.new({
	-- 		image="green_edit.png",
	-- 		size=cc.size(200, 40),
	-- 		x=240,
	-- 		y=260,
	-- 		listener=onEdit
	-- 	})
	-- input:setInputFlag(0)--设置密码输入框
	-- input:setMaxLength(10)--输入长度
	-- input:setPlaceHolder("请输入密码")--占位符
	-- self:add(input)

end

function UIScence:testCheckBox()
	local checkBox = cc.ui.UICheckBoxButton.new({
		off="check_box_normal.png",
		on="check_box_active.png"

		})
	checkBox:onButtonStateChanged(function ( event )
		if event.state=="on" then
			print("选中")
		elseif event.state=="off" then
			print("未选中")
		end
	end)
	checkBox:setButtonSelected(true)--设置是否选中
	checkBox:pos(400, 300)
	self:add(checkBox)
end

-- function UIScence:testCheckBoxGroup()
-- 	local group = cc.ui.UICheckBoxButtonGroup.new(display.TOP_TO_BOTTOM)
-- 	group:addButton(cc.ui.UICheckBoxButton.new({
-- 		off="check_box_normal.png",
-- 		on="check_box_active.png"
-- 		})
-- 			:setButtonLabel(cc.ui.UILabel.new({
-- 				text="option 1",color=cc.c3b(255,0,0)
-- 				}))
-- 			:setButtonLabelOffset(20, 0)
-- 			:align(display.LEFT_CENTER)
-- 	)

-- 	group:addButton(cc.ui.UICheckBoxButton.new({
-- 		off="check_box_normal.png",
-- 		on="check_box_active.png"
-- 		})
-- 			:setButtonLabel(cc.ui.UILabel.new({
-- 				text="opetion 2",color=cc.c3b(255,0,0)}))
-- 			:setButtonLabelOffset(20, 0)
-- 			:align(display.LEFT_CENTER)
-- 	)

-- 	group:addButton(cc.ui.UICheckBoxButton.new({
-- 		off="check_box_normal.png",
-- 		on="check_box_active.png"
-- 		})
-- 			:setButtonLabel(cc.ui.UILabel.new({
-- 				text="option 3",colcr=cc.c3b(255,0,0)}))
-- 			:setButtonLabelOffset(20,0)
-- 			:align(display.LEFT_CENTER)
-- 	)

-- 	group:addButton(cc.ui.UICheckBoxButton.new({
-- 		off="check_box_normal.png",
-- 		on="check_box_active.png"
-- 		})
-- 			:setButtonLabel(cc.ui.UILabel.new({
-- 				text="option 4",color=cc.c3b(255,0,0)}))
-- 			:setButtonLabelOffset(20, 0)
-- 			:align(display.LEFT_CENTER)
-- 	)
-- 	group:onButtonSelectChanged(function(event)
-- 		dump(event)
-- 		print("你选中了第"..event.selected.."个"）
-- 	end)
-- 		group:aligin(display.LEFT_TOP,50,display.cy)
-- 		self:add(group)
-- end




function UIScence:testScrollView()
	local scrollView = cc.ui.UIScrollView.new({
		direction=2,
		viewRect=cc.rect(60,60,360,215),
		bg="sliderProgress.png",
		bgScale9=true
		})
	--滑动式的监听事件
	scrollView:onScroll(function ( event )
		print(event.name)
	end)
	scrollView:setBounceable(false)--是否回弹
	self:add(scrollView)

	local t = {}
	for i=1,8 do
		local png = cc.ui.UIImage.new(
			string.format("Scenes/LEVELSELECTION_%d.png",i))
		t[#t+1]=png
		cc.ui.UILabel.new({text=i,size=54,color=cc.c3b(200,100,100)})
		:align(display.CENTER, png:getContentSize().width/2, png:getContentSize().height/2)
		:addTo(png)

 	end
	scrollView:fill(t,{itemSize=(t[#t]):getContentSize()})
end

function UIScence:testPageView(  )
	local pageView = cc.ui.UIPageView.new({
			viewRect = cc.rect(20, 20, 440, 280),
			column=4,row=3,
			padding = {left = 10, right = 10, top = 10, bottom = 10},
			columnSpace = 10, rowSpace = 20
		})
	pageView:onTouch(function ( event )
		print(event.pageIdx,event.itemIdx)
	end)
	self:add(pageView)

	for i=1,24 do
		local item = pageView:newItem()
		local content = cc.LayerColor:create(
			cc.c4b(math.random(250),
			math.random(250),
			math.random(250),
			250))
		content:setContentSize(100,80)
		item:addChild(content)
		pageView:addItem(item)--自动排列
	end
	pageView:reload()
end

function UIScence:testListView(  )
	local listView = cc.ui.UIListView.new({
		direction=cc.ui.UIScrollView.DIRECTION_VERTICAL,
		viewRect=cc.rect(100,20,300,200),
		bgColor=cc.c4b(200,200,200,120)
		})
	self:add(listView)
	for i=1,10 do
		local item = listView:newItem()
		local btn = cc.ui.UIPushButton.new({normal="btn-play-normal.png",pressed="btn-play-selected.png"})
		btn:setTag(i)
		btn:onButtonClicked(function ( event )
			print("点击第"..i.."行")
		end)
		item:setItemSize(200,50)
		item:addContent(btn)
		listView:addItem(item)
	end
	listView:reload()
end



function UIScence:onEnter()
end

function UIScence:onExit()
end

return UIScence





