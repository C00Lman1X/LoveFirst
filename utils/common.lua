function isInRect(p, rectp, rects)
	-- p[1] - x
	-- p[2] - y
	return p[1] > rectp[1] and p[1] < rectp[1] + rects[1] and
		p[2] > rectp[2] and p[2] < rectp[2] + rects[2]
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