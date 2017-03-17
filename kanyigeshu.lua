s=1
term.clear()
term.setCursorPos(1,1)
sucess,biaoji=turtle.inspect()	
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

  
  
