require 'button'
require 'utils.point'
require 'xml2lua'
local handler = require('xmlhandler/tree')

Menu = {
	new = function(self)
		newObj = {
			buttons = {}
		}
		self.__index = self
		return setmetatable(newObj, self)
	end,
	init = function(self, filename)

		local xml = xml2lua.loadFile(filename)
		local parser = xml2lua.parser(handler)
		parser:parse(xml)

		for k,btn in pairs(handler.root.menu.Button) do
			local pos = Point:new(tonumber(btn._attr.x), tonumber(btn._attr.y))
			local size = Point:new(tonumber(btn._attr.w), tonumber(btn._attr.h))
			local color = Point:new(tonumber(btn._attr.r), tonumber(btn._attr.g), tonumber(btn._attr.b))
			local btnObj = Button:new(pos, size, btn._attr.text, color, _G[btn._attr.func])
			table.insert(self.buttons, btnObj)
		end

	end,
	draw = function(self)
		for i,b in pairs(self.buttons) do
			b:draw()
		end
	end,
	mousepressed = function(self, x, y, button, istouch)
		for i,b in pairs(self.buttons) do
			if b:check(Point:new(x,y)) then
				b:click()
			end
		end
	end
}
