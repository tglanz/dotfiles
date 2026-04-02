-- go to definition on `shapes.Circle` or `shapes.Rectangle` in main.lua jumps here
-- hover on any function shows its signature and inferred return type

local M = {}

-- hover on `Shape` shows the table structure
-- find references on `area` shows all call sites across files
local Shape = {}
Shape.__index = Shape

function Shape:new(o)
    return setmetatable(o or {}, self)
end

function Shape:area()
    error("area() not implemented")
end

M.Circle = Shape:new()
M.Circle.__index = M.Circle

-- go to definition on `Circle.new` in main.lua jumps here
function M.Circle:new(radius)
    return Shape.new(self, { radius = radius })
end

-- find references on `area` shows all implementations and call sites
function M.Circle:area()
    return math.pi * self.radius ^ 2
end

M.Rectangle = Shape:new()
M.Rectangle.__index = M.Rectangle

function M.Rectangle:new(width, height)
    return Shape.new(self, { width = width, height = height })
end

function M.Rectangle:area()
    return self.width * self.height
end

function M.add(a, b)
    return a + b
end

return M
