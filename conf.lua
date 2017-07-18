function love.conf(t)
	t.window.width = 1024
	t.window.height = 768
	t.window.title = 'first'
	t.console = true

	package.path = package.path .. ';/home/adyak/love/utils/?.lua'
end
