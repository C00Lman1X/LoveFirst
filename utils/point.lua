require 'utils.class'

Point = class(function(self, x, y, z)
  self.x = x or 0
  self.y = y or 0
  self.z = z or 0
end)

local function eq(x,y)
  return x == y
end

function Point.__eq(p1,p2)
  return eq(p1.x,p2.x) and eq(p1.y,p2.y) and eq(p1.z,p2.z)
end

function Point:get()
  return self.x, self.y, self.z
end

-- vector addition is '+','-'
function Point.__add(p1,p2)
  return Point(p1.x+p2.x, p1.y+p2.y, p1.z+p2.z)
end

function Point.__sub(p1,p2)
  return Point(p1.x-p2.x, p1.y-p2.y, p1.z-p2.z)
end

-- unitary minus  (e.g in the expression f(-p))
function Point.__unm(p)
  return Point(-p.x, -p.y, -p.z)
end

-- scalar multiplication and division is '*' and '/' respectively
function Point.__mul(s,p)
  return Point( s*p.x, s*p.y, s*p.z )
end

function Point.__div(p,s)
  return Point( p.x/s, p.y/s, p.z/s )
end

-- dot product is '..'
function Point.__concat(p1,p2)
  return p1.x*p2.x + p1.y*p2.y + p1.z*p2.z
end

-- cross product is '^'
function Point.__pow(p1,p2)
   return Point(
     p1.y*p2.z - p1.z*p2.y,
     p1.z*p2.x - p1.x*p2.z,
     p1.x*p2.y - p1.y*p2.x
   )
end

function Point:normalize()
  local l = self:len()
  self.x = self.x/l
  self.y = self.y/l
  self.z = self.z/l
end

function Point:translate(x,y,z)
   self.x = self.x + x
   self.y = self.y + y
   self.z = self.z + z 
end

function Point.__tostring(p)
  return string.format('(%f,%f,%f)',p.x,p.y,p.z)
end

local function sqr(x) return x*x end

function Point:len()
  return math.sqrt(sqr(self.x) + sqr(self.y) + sqr(self.z))
end
