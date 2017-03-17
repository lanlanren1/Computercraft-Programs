--林场程序。
--模块1	放置土壤
--模块2	清理土壤
--模块3	种树砍树

--界面
local moshi = 3
local tArgs = { ... }

if tArgs[1] then
	local shuru = tonumber( tArgs[1] )

	print( "shuru:",shuru)
	
	if shuru ~= 3 then
		moshi=shuru
	end
end 
print( "moshi:",moshi)

--移动函数
local function go(fx)
	if fx==1 then
		while not turtle.forward() do
			if not turtle.dig() then
				while turtle.attack() do
				end
			end
		end
	end
	if fx==2 then
		while not turtle.up() do
			if not turtle.digUp() then
				while turtle.attackUp() do
				end
			end
		end
	end
	if fx==3 then
		while not turtle.down() do
			if not turtle.digDown() then
				while turtle.attackDown() do
				end
			end
		end
	end
	if fx==4 then
		while not turtle.back() do
			turtle.turnLeft()
			turtle.turnLeft()
			while turtle.detect() do
				turtle.dig()
			end
			while turtle.attack() do
			end
			turtle.turnLeft()
			turtle.turnLeft()
		end
	end
end

--砍树函数
local function famu()
	local s=1
	local sucess,biaoji=turtle.inspect()	
	turtle.dig()
	turtle.forward()
	print("biaoji:",biaoji.name)
	while true do
		su,muzhuang=turtle.inspectUp()
		if muzhuang.name==biaoji.name then
			turtle.digUp()
			turtle.up()
			s=s+1
		else
			break
		end
	end
	while not turtle.detectDown() do
		turtle.down()
	end
	turtle.back()
	print("high= ",s)
end

--模块1
local function fangtu()
	print("dirt in slot 1")
	print("press any key to continue...")
	os.pullEvent("key")
	turtle.select(1)
	for i=1,28 do
		local sucess,data= turtle.inspectDown()
		
		if not ((data.name=="minecraft:dirt") or (data.name=="minecraft:grass")) then
			turtle.digDown()
			turtle.placeDown()
		end
		if (i==14 or i==15 or i==20) then
			turtle.turnRight()
		end
		go(1)
		go(1)
		go(1)
		if i==28 then
			turtle.turnRight()
		end
	end
end	

--模块2
local function qingli()
	for i=1,28 do
		turtle.digDown()
		if (i==14 or i==15 or i==28) then
			turtle.turnRight()
		end
		go(1)
		go(1)
		go(1)
		if i==20 then
			turtle.turnRight()
		end
	end
end

--模块3
local function qiaofu()
	print("28 saplings in slot 1")
	print("press any key to continue...")
	os.pullEvent("key")
	for i=1,28 do
		if i~=15 then
			turtle.turnLeft()
		end
		local sucess,data= turtle.inspect()
		if data.name=="minecraft:log" then
			famu()
		end
		if not turtle.detect() then
			turtle.place()
		end
		turtle.turnRight()
		if (i==14 or i==28) then
			turtle.turnRight()
		else
			go(1)
			go(1)
		end	
		go(1)
	end
	turtle.turnRight()
end

--运行
if moshi==1 then
	print("fangtu")
	fangtu()
end
if moshi==2 then
	qingli()
end
if moshi==3 then
	qiaofu()
end
