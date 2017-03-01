--林场程序。
--模块1	放置土壤
--模块2	清理土壤
--模块3	种树砍树

--界面
local moshi = 4
local tArgs = { ... }

if tArgs[1] then
	local shuru = tonumber( tArgs[1] )
	if 0 < shuru < 5 then
		moshi = suru
	end
end 

--模块1
local function fangtu()
	print("dirt in slot 1")
	print("press any key to continue...")
	os.pullEvent("key")
	turtle.select(1)
	for i=1,10 do
		local sucess,data= turtle.inspect()
		if not data.name== "minecraft:dirt" then
			turtle.placeDown()
		end
	end
end	

--运行
if moshi==1 then
	fangtu()
end
