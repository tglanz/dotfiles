/**
 * A circle defined by its radius.
 *
 * Go to definition on {@code Circle} in Main.java jumps here.
 * Hover shows class hierarchy: Circle implements Shape.
 */
public class Circle implements Shape {
    private final double radius;

    /**
     * Construct a Circle with the given radius.
     *
     * @param radius The radius of the circle. Must be positive.
     *
     * Go to definition on {@code new Circle(...)} in Main.java jumps here.
     */
    public Circle(double radius) {
        this.radius = radius;
    }

    /**
     * Return the area of the circle (pi * radius^2).
     *
     * @return The area as a double.
     *
     * Find references on {@code area} shows all call sites.
     */
    @Override
    public double area() {
        return Math.PI * radius * radius;
    }

    /**
     * Return the display name of this shape.
     *
     * @return The string "circle".
     */
    @Override
    public String name() {
        return "circle";
    }
}
