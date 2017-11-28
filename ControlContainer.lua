require 'Control'

ControlContainer = class(function(self)
    self.controls = {}
    self.active = true
    self.visible = true
    self.clickable = {}
end)

function ControlContainer:add(control)
    table.insert(self.controls, control)
end

function ControlContainer:CallbackAllControls(func_name, ...)
    for i = 1, #self.controls do
        local control = self.controls[i]
        control[func_name](control, ...)
    end
end

function ControlContainer:mousepressed(x, y)
    for i = 1, #self.controls do
        local control = self.controls[i]
        if control.isHovered then
            control:mousepressed()
        end
    end
end

function ControlContainer:mousemoved(x,y)
    print(string.format('mousemoved %d, %d', x, y))
    for i = 1, #self.controls do
        local control = self.controls[i]
        if control:isIn(x,y) then
            print(string.format('control #%d hovered', i))
            control.isHovered = true
        else
            print(string.format('control #%d NOT hovered', i))
            control.isHovered = false
        end
    end
end