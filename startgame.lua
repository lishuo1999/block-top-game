		 
		local pause

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
		pause = false


		local gamescene = display.newImage("/image/sky.png",0,0)
		local ground = display.newRect(200,495,400,60)
		ground:setFillColor(CC("58B947"))
		physics.addBody(ground,"static",{ bounce=0.0, friction=3.0})
		local blockArray = {}
		local singleBlock_ = display.newRoundedRect(0,110,70,70,10)
		singleBlock_:setFillColor(CC("fbfd95"))
		transition.to(singleBlock_,{time=2000,x=315, y=110})
		for j=2000, 900000,4000 do
			local transition1 = transition.to(singleBlock_,{time=2000,delay=j, x=0, y=110})
			local transition2 = transition.to(singleBlock_,{time=2000,delay=j+2000,x=315, y=110})
		end

		local function addblock () 
		local singleBlock = display.newRoundedRect(0,110,70,70,10)
		blockArray[#blockArray+1] = singleBlock
		singleBlock:setFillColor(CC("fbfd95"))
		transition.to(singleBlock,{time=2000,x=315, y=110})
			for j=2000, 900000,4000 do
			local transition1 = transition.to(singleBlock,{time=2000,delay=j, x=0, y=110})
			local transition2 = transition.to(singleBlock,{time=2000,delay=j+2000,x=315, y=110})
		    end
		end
		
		local function dropblock()
		        transition.pause()
		        for i,singleBlock in ipairs(blockArray) do
		        	physics.addBody(singleBlock,"dynamic",{density=5.0,friction=3.0,bounce=0.0})
		        end
		end
        local function onTouch (e)
        	if e.phase == "began" then
        		if pause == false then
        			physics.addBody(singleBlock_,"dynamic",{density=5.0,friction=3.0,bounce=0.0})
					dropblock()
					addblock()
        		end
				print("test")
        	end
        end
        gamescene:addEventListener("touch" ,onTouch)

        local time = display.newRoundedRect(203,-10,65,30,5,5)
        local time_ = display.newImage("/image/timez.png",203,-10)
        time_:scale(0.3,0.3)
        local times = display.newText("1",250,-10)
        local stop = display.newRoundedRect(160,-10,30,30,5,5)
        stop:setFillColor(CC("fce4fa"))
        local box = display.newRoundedRect(20,-10,30,30,5,5)
        box:setFillColor(CC("fbfd95"))
        local score = display.newText("점수 :",25,30)
        score:setFillColor(CC("000000"))
        local stop1 = display.newRect(166,-10,7,20)
        stop1:setFillColor(CC("ffffff"))
        local stop2 = display.newRect(155,-10,7,20)
        stop2:setFillColor(CC("ffffff"))

        
        


        local menu, regame, regame_, continuegame, continuegame_, exit, exit_, start
        
        local function menus ()
        	start = display.newImage("/image/start botton.png",163,-10)
        	start:scale(0.25,0.25)
        	menu = display.newRoundedRect(165,240,200,240,5)
        	menu:setFillColor(CC("aef7f7"))
        	continuegame = display.newRoundedRect(163,172,120,35,5)
        	continuegame_ = display.newText("계속하기",163,172)
        	continuegame_:setFillColor(CC("000000"))
        	continuegame:setFillColor(CC("fce4fa"))
        	regame = display.newRoundedRect(163,235,120,35,5)
        	regame_ = display.newText("다시시작",163,235)
        	regame_:setFillColor(CC("000000"))
        	regame:setFillColor(CC("fce4fa"))
        	exit = display.newRoundedRect(163,298,120,35,5)
        	exit_ = display.newText("그만하기",163,298)
        	exit_:setFillColor(CC"000000")
        	exit:setFillColor(CC("fce4fa"))

        end

        local continuegame1 = display.newRoundedRect(163,172,120,35,5)
        continuegame1.alpha = 0.1
        local function stops (e)
        	if e.phase == "began" then
        		if pause == false then
        			menus()
        			stop1:removeSelf()
        			stop2:removeSelf()
        			pause = true
        			transition.pause()
        		elseif pause == true then
        			pause = false
        			menu:removeSelf()
        			continuegame:removeSelf()
        			continuegame_:removeSelf()
        			regame:removeSelf()
        			regame_:removeSelf()
        			exit:removeSelf()
        			exit_:removeSelf()
        			stop1 = display.newRect(166,-10,7,20)
        			stop2 = display.newRect(155,-10,7,20)
        			start:removeSelf()
        		end
        	end
        end
        stop:addEventListener("touch" , stops)
        
        local function stops1 (e)
                if e.phase == "began" then
                        if pause == true then
                                pause = false
                                menu:removeSelf()
                                continuegame:removeSelf()
                                continuegame_:removeSelf()
                                regame:removeSelf()
                                regame_:removeSelf()
                                exit:removeSelf()
                                exit_:removeSelf()
                                stop1 = display.newRect(166,-10,7,20)
                                stop2 = display.newRect(155,-10,7,20)
                                start:removeSelf()
                        elseif pause == false then
                        end
                end
        end
        continuegame1:addEventListener("touch" , stops1)


        local function restart (e)
                if e.phase == "began" then
                        pause = false
                                menu:removeSelf()
                                continuegame:removeSelf()
                                continuegame_:removeSelf()
                                regame:removeSelf()
                                regame_:removeSelf()
                                exit:removeSelf()
                                exit_:removeSelf()
                                stop1 = display.newRect(166,-10,7,20)
                                stop2 = display.newRect(155,-10,7,20)
                                start:removeSelf()
                end
        end
        continuegame1:addEventListener("touch" , stops1)

                local t = {}
