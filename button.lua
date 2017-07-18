require 'class'

Button = class(function(slf, pos, size, text, action)
	slf.pos = pos
	slf.size = size
	slf.text = text
	slf.action = action
end)

function Button:check(pos)
	return pos[1] > self.pos[1] and pos[1] < self.pos[1] + self.size[1] and
		pos[2] > self.pos[2] and pos[2] < self.pos[2] + self.size[2]
end

function Button:click()
	self.action()
end

function Button:draw()
	r, g, b, a = love.graphics.getColor()

	love.graphics.setColor(100, 100, 100)
	love.graphics.rectangle('fill', slf.pos[1], slf.pos[2], slf.size[1], slf.size[2])
	love.graphics.rectangle('line', slf.pos[1], slf.pos[2], slf.size[1], slf.size[2])

	love.graphics.setColor(r, g, b, a)
end

