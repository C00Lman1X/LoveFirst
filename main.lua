require 'point'
require 'button'
require 'xml2lua'
local handler = require('xmlhandler/tree')

function Btn1Click()
	print("Btn1")
end

function love.load()
	local xml = xml2lua.loadFile('menu.xml')
	local parser = xml2lua.parser(handler)
	parser:parse(xml)

	menu = {}
	for k,btn in pairs(handler.root.menu.Button) do
		local pos = Point:new(tonumber(btn._attr.x), tonumber(btn._attr.y))
		local size = Point:new(tonumber(btn._attr.w), tonumber(btn._attr.h))
		local color = Point:new(tonumber(btn._attr.r), tonumber(btn._attr.g), tonumber(btn._attr.b))
		local btnObj = Button:new(pos, size, btn._attr.text, color, _G[btn._attr.func])
		table.insert(menu, btnObj)
	end

	for i,b in pairs(menu) do
		print(i,b)
	end

	love.graphics.setBackgroundColor(255, 255, 255)
end

function love.update(dt)
end

function love.keypressed(key, scancode, isrepeat)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.mousepressed(x, y, button, istouch)
	for i,b in pairs(menu) do
		if b:check(Point:new(x,y)) then
			b:click()
		end
	end
end

function love.draw()
	for i,b in pairs(menu) do
		b:draw()
	end
end
