require 'Control'

Button = class(Control, function(self, pos, size, text, color, action)
    Control.__ctr(self, pos, size)
    self.size = size
    self.text = text
    self.color = color
    self.action = action
end)

function Button:mousepressed()
    self.action()
end

function Button:drawInternal()
    -- color should be cached in Control:draw()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b)
    love.graphics.rectangle('fill', self.pos.x, self.pos.y, self.size.x, self.size.y)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(self.text, self.pos.x, self.pos.y, self.size.x, 'center')
    love.graphics.rectangle('line', self.pos.x, self.pos.y, self.size.x, self.size.y)
end