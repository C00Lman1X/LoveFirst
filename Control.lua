require 'utils.class'
require 'utils.common'

local CURRENT_ID = 0

Control = class(function(self, pos, sz)
    self.pos = pos
    self.boxSize = sz
    CURRENT_ID = CURRENT_ID + 1
    self.id = CURRENT_ID
    self.isHovered = false
end)

function Control:isIn(x,y)
    return isInRect(Point(x,y), self.pos, self.boxSize)
end

function Control:draw()
    local r,g,b,a = love.graphics.getColor()
    
    self:drawInternal()

    if self.isHovered then
        love.graphics.setColor(200,0,0,255)
        love.graphics.rectangle('line', self.pos.x, self.pos.y, self.boxSize.x, self.boxSize.y)
    end

    love.graphics.setColor(r,g,b,a)
end

function Control:drawInternal()
end

function Control:mousepressed()
    print('Unimplemented function mousepressed!')
end