--
shell.run("clear")

local f=turtle.getFuelLevel()
print("Fuel: ",f)
while turtle.getFuelLevel()<300 do
	print("put Fuel items in slot 1.")
	turtle.refuel()
	os.sleep(5)
end

print("Please put saplings in slot 1,a log in slot 2.")
print("Nomber of trees to plant:")
s=tonumber(io.read())

for j=1,2 do
	for i=1,s do
		n=0
		turtle.dig()
		turtle.forward()
		turtle.select(2)
		while turtle.compareUp() do
			turtle.digUp()
			turtle.up()
			n=n+1
		end
		if n==0 then
			turtle.forward()
			turtle.turnLeft()
			turtle.turnLeft()
			turtle.select(1)
			turtle.place()
			turtle.turnRight()
			turtle.turnRight()
		else
			for i=1,n-1 do
				turtle.down()
			end
			turtle.select(1)
			turtle.placeDown()
			turtle.dig()
			turtle.forward()
			turtle.down()
		end
		if i==s then
			turtle.turnRight()
			for k=1,4 do
				turtle.forward()
			end
			turtle.turnRight()
		else
			turtle.forward()
		end
	end
end

  
  
