require 'Button'
require 'ControlContainer'
require 'utils.point'
require 'utils.common'

function Btn1Click()
	print('Btn1')
end

function love.load()
	love.graphics.setBackgroundColor(255, 255, 255)

	controls = ControlContainer()

	local b = Button(Point(100, 100), Point(100, 30), 'Btn1', {r=100,g=100,b=100}, Btn1Click)
	for i,j in pairs(b) do
		print(i, j)
	end
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
	controls:mousepressed(x, y)
end

function love.mousereleased(x, y, button, istouch)
end

function love.mousemoved( x, y, dx, dy, istouch )
	controls:mousemoved(x, y)
end

function love.draw()
	if controls.visible then
		controls:CallbackAllControls('draw')
	end
end
