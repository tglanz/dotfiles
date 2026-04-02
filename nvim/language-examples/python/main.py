from shapes import add, Circle, Rectangle, Shape
# go to definition on `Shape`, `Circle`, `add` jumps to shapes.py
# hover on any import shows its docstring and type signature

def print_area(shape: Shape) -> None:
    # hover on `shape` shows type: Shape
    # go to definition on `area` jumps to the abstract method in shapes.py
    print(f"area: {shape.area()}")


result = add(3, 4)
# hover on `result` shows inferred type: int
# rename on `result` renames all uses in this file
# go to definition on `add` jumps to shapes.py

c = Circle(5.0)
# go to definition on `Circle` jumps to shapes.py
# hover on `c.radius` shows type: float
# find references on `Circle` shows all usages across the project

r = Rectangle(3.0, 4.0)

print_area(c)
# find references on `print_area` shows all call sites

print_area(r)
print("sum:", result)

# code action: pyright can suggest missing type annotations,
# fix import order, add missing __init__ args, etc.
