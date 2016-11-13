
local add, add1, add1_, add2, add2_, textb1, textb2,textb3,textb4,textb5
local cdd, cdd1, cdd1_, cdd2, cdd2_, cdd3, cdd3_, cdd4, cdd4_

local function b_exit(e)
	if e.phase == "began" then
		add:removeSelf()
		add1:removeSelf()
		add1_:removeSelf()
		add2:removeSelf()
		add2_:removeSelf()
		textb1:removeSelf()
		textb2:removeSelf()
		textb3:removeSelf()
		textb4:removeSelf()
		textb5:removeSelf()
	end
end

local function c_exit(e) 
	if e.phase == "began" then
		cdd:removeSelf()
		cdd1:removeSelf()
		cdd1_:removeSelf()
		cdd2:removeSelf()
		cdd2_:removeSelf()
		cdd3:removeSelf()
		cdd3_:removeSelf()
		cdd4:removeSelf()
		cdd4_:removeSelf()
	end
end


 local function CC(hex)
		   local r = tonumber( hex:sub(1,2), 16) / 255
		   local g = tonumber( hex:sub(3,4), 16) / 255
		   local b = tonumber( hex:sub(5,6), 16) / 255
		   local a = 255/255
		   if #hex == 8 then a = tonumber(hex:sub(7, 8), 16) / 255 end
		   return r,g,b,a
		end

		local _W = display.contentWidth
		local _H = display.contentHeight
		local physics = require 'physics'
		physics.start()
		physics.setGravity(0,9.5)

		local startscene = display.newRect(0,0,display.contentWidth*10,display.contentHeight*10	)
		startscene:setFillColor(CC("aef7f7"))

		local startscene = display.newImage("/image/Block Top.png",164,-100)
		physics.addBody(startscene)
		local w = display.newRect(165,200,200,20)
		w:setFillColor(CC("aef7f7"))
		physics.addBody(w,"static")
	
		local a = display.newRoundedRect(-163,270,130,35,10)
		transition.to(a,{time = 2000,x=163,y=270})
		a:setFillColor(CC("fce4fa"))
		local a_ = display.newText("게임 시작",-163,270)
		transition.to(a_,{time = 2000,x=163,y=270})
		a_:setFillColor(CC("000000"))
		local b = display.newRoundedRect(-163,330,130,35,10)
		transition.to(b,{time = 2000,delay=700,x=163,y=330})
		b:setFillColor(CC("fce4fa"))
		local b_ = display.newText("게임 설명",-163,330)
		transition.to(b_,{time = 2000,delay=700,x=163,y=330})
		b_:setFillColor(CC("000000"))
 		local c = display.newRoundedRect(-163,390,130,35,10)
 		transition.to(c,{time = 2000,delay=1400,x=163,y=390})
 		c:setFillColor(CC("fce4fa"))
 		local c_ = display.newText("나가기",-163,390)
 		transition.to(c_,{time = 2000,delay=1400,x=163,y=390})
 		c_:setFillColor(CC("000000"))

 		

 		local function b_s ()
 			add = display.newRect(165,240,250,170)
 			add:setFillColor(CC("000000"))
 			add1 = display.newRect(165,165,250,20)
 			add1_ = display.newText("게임 설명",165,165)
 			add1_:setFillColor(CC("000000"))
 			add2 = display.newRect(279,165,17,17)
 			add2:setFillColor(CC("000000"))
 			add2_ = display.newText("X",279,165)
 			textb1 = display.newText("화면을 터치하면 움직이고 있는 블럭을",170,210)
 			textb1.size = 11
 			textb2 = display.newText("떨어트릴 수 있다. 블럭을 이용하여",170,225)
 			textb2.size = 11
 			textb3 = display.newText("탑을 쌓아가는데 탑이 무너지면 게임이",170,240)
 			textb3.size = 11
 			textb4 = display.newText("종료된다. 단, 시간제한이 있다.",170,255)
 			textb4.size = 11
 			textb5 = display.newText("시간내에서 최대한 높은 탑을 쌓아가야한다.",170,270)
 			textb5.size = 11
 			add2:addEventListener("touch", b_exit)
 		end

 		local function c_s ()
 			cdd = display.newRect(165,240,250,170)
 			cdd:setFillColor(CC("000000"))
 			cdd1 = display.newRect(165,165,250,20)
 			cdd1_ = display.newText("나가시겠습니까?",175,230)
 			cdd2 = display.newRect(279,165,17,17)
 			cdd2:setFillColor(CC("000000"))
 			cdd2_ = display.newText("X",279,165)
 			cdd3 = display.newRect(105,305,100,20)
 			cdd3_ = display.newText("예",105,305)
 			cdd3_:setFillColor(CC("000000"))
 			cdd4 = display.newRect(228,305,100,20)
 			cdd4_ = display.newText("아니요",230,305)
 			cdd4_:setFillColor(CC("000000"))
 			cdd2:addEventListener("touch", c_exit)
 			cdd4:addEventListener("touch", c_exit)
 		end

 		local function onTouch (e)
        	if e.phase == "began" then
         	    b_s()
        	end
        end
        b:addEventListener("touch",onTouch)

        local function exit (e)
        	if e.phase == "began" then
         	    c_s()
        	end
        end
        c:addEventListener("touch",exit)

        local function startgame (e)
        	if e.phase == "began" then
        	end
        end



		