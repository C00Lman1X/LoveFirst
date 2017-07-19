require 'common'
require 'point'

Button = {
	new = function(self, pos, size, text, color, action)
		newObj = {
			pos = Point:new(pos[1], pos[2], pos[3]),
			size = Point:new(size[1], size[2], size[3]),
			text = text,
			action = action,
			color = Point:new(color[1], color[2], color[3])
		}
		self.__index = self
		return setmetatable(newObj, self)
	end,
	check = function(self, pos)
		return isInRect(pos, self.pos, self.size)
	end,
	click = function(self) 
		if self.action ~= nil then
			self.action()
		end
	end,
	draw = function(self)
		r, g, b, a = love.graphics.getColor()

		love.graphics.setColor(self.color:get())
		love.graphics.rectangle('fill', self.pos[1], self.pos[2], self.size[1], self.size[2])
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle('line', self.pos[1], self.pos[2], self.size[1], self.size[2])

		love.graphics.setColor(r, g, b, a)
	end
}

