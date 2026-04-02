#pragma once

/**
 * Abstract base class for all shapes.
 *
 * Go to definition on `Shape` in main.cpp jumps here.
 * Hover on Shape anywhere shows this docstring and class layout.
 */
class Shape {
public:
    /**
     * Calculate the area of the shape.
     *
     * @return The area as a double.
     *
     * Go to definition on `area()` call in main.cpp jumps to geometry.cpp.
     */
    virtual double area() const = 0;
    virtual ~Shape() = default;
};

/**
 * A circle defined by its radius.
 *
 * Go to definition on `Circle` in main.cpp jumps here.
 */
class Circle : public Shape {
public:
    /**
     * Construct a Circle with the given radius.
     *
     * @param radius The radius of the circle. Must be positive.
     */
    explicit Circle(double radius);

    /**
     * Return the area of the circle (pi * radius^2).
     *
     * @return The area as a double.
     */
    double area() const override;

private:
    double radius_;
};

/**
 * A rectangle defined by width and height.
 */
class Rectangle : public Shape {
public:
    /**
     * Construct a Rectangle with the given dimensions.
     *
     * @param width  The horizontal dimension.
     * @param height The vertical dimension.
     */
    Rectangle(double width, double height);

    /**
     * Return the area of the rectangle (width * height).
     *
     * @return The area as a double.
     */
    double area() const override;

private:
    double width_, height_;
};
