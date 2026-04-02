import math
from abc import ABC, abstractmethod

# go to definition on `Shape`, `Circle`, `Rectangle` in main.py jumps here
# hover on any class or method shows its docstring and signature

class Shape(ABC):
    """Base class for all shapes.

    All shapes must implement the area() method.
    This docstring is shown when hovering over Shape anywhere.
    """

    @abstractmethod
    def area(self) -> float:
        """Calculate and return the area of the shape.

        Returns:
            float: The area of the shape.

        Hover on any call to area() to see this docstring.
        Go to definition on `area` call in main.py jumps here.
        """
        ...


class Circle(Shape):
    """A circle defined by its radius.

    Hover over Circle in main.py to see this docstring.
    """

    def __init__(self, radius: float) -> None:
        """Initialize a Circle with the given radius.

        Args:
            radius: The radius of the circle. Must be positive.

        Hover on `Circle(5.0)` in main.py shows this signature and docstring.
        """
        self.radius = radius

    def area(self) -> float:
        """Return the area of the circle.

        Returns:
            float: pi * radius^2

        Find references on `area` shows all call sites across files.
        """
        return math.pi * self.radius ** 2


class Rectangle(Shape):
    """A rectangle defined by width and height."""

    def __init__(self, width: float, height: float) -> None:
        """Initialize a Rectangle.

        Args:
            width: The horizontal dimension.
            height: The vertical dimension.
        """
        self.width = width
        self.height = height

    def area(self) -> float:
        """Return the area of the rectangle.

        Returns:
            float: width * height
        """
        return self.width * self.height


def add(a: int, b: int) -> int:
    """Return the sum of two integers.

    Args:
        a: The first integer.
        b: The second integer.

    Returns:
        int: The sum of a and b.

    Hover on any call to add() in main.py to see this docstring and signature.
    """
    return a + b
