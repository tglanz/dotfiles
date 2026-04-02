local shapes = require("shapes")
-- go to definition on `shapes` jumps to shapes.lua
-- hover on `shapes` shows the module table and its fields

local result = shapes.add(3, 4)
-- hover on `result` shows inferred type: number
-- go to definition on `add` jumps to shapes.lua
-- rename on `result` renames all uses in this scope

local c = shapes.Circle:new(5.0)
-- go to definition on `Circle` jumps to shapes.lua
-- hover on `c` shows inferred type: table

local r = shapes.Rectangle:new(3.0, 4.0)

local function print_area(shape)
    -- go to definition on `area` jumps to the method in shapes.lua
    -- find references on `area` shows all call sites across files
    print("area: " .. shape:area())
end

print_area(c)
-- find references on `print_area` shows all call sites

print_area(r)
print("sum: " .. result)

-- code action: lua_ls can infer missing fields, flag undefined globals,
-- and warn on type mismatches based on inferred types
