term.clear()
term.setCursorPos(1,1)
for i=1,4 do
	turtle.select(i)
	while turtle.getItemCount(i)==0 do
		print("Make a Blacklist first!")
		print("Press any key to continue.")
		os.pullEvent("key")
	end
	turtle.select(1)
end
local wcx=0
local cPos=505050
local pos={}
pos[505050]=0
--行路函数。1:前，2：上,3:下,4,后。乌龟朝向初始wcx=0,south
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
local function move(mfx)
	go(mfx)
	if mfx==1 then
		if wcx==0 then
			cPos=cPos+1
		elseif wcx==1 then
			cPos=cPos-10000
		elseif wcx==2 then
			cPos=cPos-1
		elseif wcx==3 then
			cPos=cPos+10000
		end
	elseif mfx==2 then
		cPos=cPos+100
	elseif mfx==3 then
		cPos=cPos-100
	elseif mfx==4 then
		if wcx==0 then
			cPos=cPos-1
		elseif wcx==1 then
			cPos=cPos+10000
		elseif wcx==2 then
			cPos=cPos+1
		elseif wcx==3 then
			cPos=cPos-10000
		end
	end
end
--计算乌龟四个方向坐标
local function xPos(p)
	local ps=0
	if p>3 then
		p=p-4
	elseif p<0 then
		p=p+4
	end
	if p==0 then
		ps=cPos+1
	elseif p==1 then
		ps=cPos-10000
	elseif p==2 then
		ps=cPos-1
	elseif p==3 then
		ps=cPos+10000
	end
	return ps
end
--转向函数：乌龟初始朝向wcx=0，依次是0,1,2,3.
local function zhuan(cx)
	if cx>3 then cx=cx-4
	elseif cx<0 then cx=cx+4
	end
	if cx-wcx==1 or cx-wcx==-3 then
		turtle.turnRight()
	elseif cx-wcx==2 or cx-wcx==-2 then
		turtle.turnRight()
		turtle.turnRight()
	elseif cx-wcx==3 or cx-wcx==-1 then
		turtle.turnLeft()
	end
	wcx=cx
end
--对比函数
function notCompare(d)
	local t={true,true,true,true}
	for i=1,4 do
		turtle.select(i)
		if d==1 then
			t[i]=turtle.compare()
		end
		if d==2 then
			t[i]=turtle.compareUp()
		end
		if d==3 then
			t[i]=turtle.compareDown()
		end
	end
	turtle.select(1)
	if not (t[1] or t[2] or t[3] or t[4]) then
		return true
	else
		return false 
	end
end
--搜矿函数
local function sou()
	local cx=wcx
	for i=0,3 do
		if not pos[xPos(cx+i)] then
			zhuan(cx+i)
			if turtle.detect() and notCompare(1) then
				move(1)
				pos[cPos]=0
				sou()
				move(4)
			else
				pos[xPos(cx+i)]=1
			end
		end
	end
	zhuan(cx)
	if not pos[cPos+100] then
		if turtle.detectUp() and notCompare(2) then
			move(2)
			pos[cPos]=0
			sou()
			move(3)
		else
			pos[cPos+100]=1
		end
	end
	if not pos[cPos-100] then
		if turtle.detectDown() and notCompare(3) then
			move(3)
			pos[cPos]=0
			sou()
			move(2)
		else
			pos[cPos-100]=1
		end
	end
end
sou()