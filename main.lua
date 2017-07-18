require 'point'

function love.load()
	p1 = Point(100, 100)
	p2 = Point(200, 200)
end

function love.update(dt)
end

function love.keypressed(key, scancode, isrepeat)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.draw()
	love.graphics.setColor(255, 255, 255)
	local x,y,z = p1:get()
	love.graphics.rectangle('fill', x, y, 100, 100)
	love.graphics.getColor(0, 0, 0)
end
