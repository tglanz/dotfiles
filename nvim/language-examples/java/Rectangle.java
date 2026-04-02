/**
 * A rectangle defined by width and height.
 *
 * Go to definition on {@code Rectangle} in Main.java jumps here.
 */
public class Rectangle implements Shape {
    private final double width;
    private final double height;

    /**
     * Construct a Rectangle with the given dimensions.
     *
     * @param width  The horizontal dimension.
     * @param height The vertical dimension.
     */
    public Rectangle(double width, double height) {
        this.width = width;
        this.height = height;
    }

    /**
     * Return the area of the rectangle (width * height).
     *
     * @return The area as a double.
     */
    @Override
    public double area() {
        return width * height;
    }

    /**
     * Return the display name of this shape.
     *
     * @return The string "rectangle".
     */
    @Override
    public String name() {
        return "rectangle";
    }
}
