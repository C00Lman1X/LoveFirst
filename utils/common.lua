function isInRect(p, rectp, rects)
	return p.x > rectp.x and p.x < rectp.x + rects.x and
		p.y > rectp.y and p.y < rectp.y + rects.y
end

function recursivePrint(t, tabs)
	tabs = tabs or ''
	print(tabs, t)
	if type(t) ~= 'table' then
		return
	end
	for i,v in pairs(t) do
		print(tabs..i,v)
		if type(v) == 'table' then
			recursivePrint(v, tabs .. '\t')
		end
	end
end