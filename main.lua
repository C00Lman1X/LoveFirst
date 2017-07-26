require 'control'
require 'utils.point'
require 'utils.common'

function Btn1Click()
	print('Btn1')
end

function love.load()
	love.graphics.setBackgroundColor(255, 255, 255)

	controls = ControlContainer()

	local b = Button(Point(100, 100), Point(100, 30), 'Btn1', {r=100,g=100,b=100}, Btn1Click)
	controls:add(b)
end

function love.update(dt)
end

function love.keypressed(key, scancode, isrepeat)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.mousepressed(x, y, button, istouch)
end

function love.mousereleased(x, y, button, istouch)
end

function love.mousemoved( x, y, dx2, dy2, istouch )
end

function love.draw()
	controls:CallbackAllControls('draw')
end
