require 'utils.class'
require 'utils.common'

Control = class(function(self, pos)
    self.pos = pos
end)

function Control:checkMouseMove(x, y)
    return false
end

function Control:mousepressed()
end

function Control:mousereleased()
end

function Control:checkmouse()
end

function Control:draw()
    local r,g,b,a = love.graphics.getColor()
    love.graphics.setColor(0,0,0)
    local x, y = self.pos.x, self.pos.y
    love.graphics.line(x-50, y-50, x+50, y+50)
    love.graphics.line(x+50, y-50, x-50, y+50)

    love.graphics.setColor(r,g,b,a)
end

Button = class(Control, function(self, pos, size, text, color, action)
    Control.__ctr(self, pos)
    self.size = size
    self.text = text
    self.color = color
    self.action = action
end)

function Button:mousepressed()
    self.action()
end

function Button:checkmouse(x, y)
    return isInRect(Point(x,y), self.pos, self.size)
end

-- Container
ControlContainer = class(function(self)
    self.controls = {}
end)

function ControlContainer:add(control)
    table.insert(self.controls, control)
end

function ControlContainer:CallbackAllControls(func_name, ...)
    for i = 1, #controls do
        local control = controls[i]
        control[func_name](control, ...)
    end
end