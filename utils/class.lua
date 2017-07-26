-- ctr should be function(o, ...)
function class(base, ctr)
    local c = {}
    if not ctr and type(base) == 'function' then
        ctr = base
        base = nil
    elseif type(base) == 'table' then
        for i,v in pairs(base) do
            c[i] = v
        end
    c.__base = base
    end
    c.__index = c

    local mt = {
        __call = function(self, ...)
            local newObj = {}
            if ctr then
                ctr(newObj, ...)
            end
            if base and base.__ctr then
                base.__ctr(newObj, ...)
            end
            return setmetatable(newObj, self)
        end
    }
    c.__ctr = ctr
    return setmetatable(c, mt)
end