/**
 * Interface representing a geometric shape.
 *
 * Go to definition on {@code Shape} in Main.java jumps here.
 * Hover on Shape anywhere shows this docstring.
 */
public interface Shape {

    /**
     * Calculate the area of the shape.
     *
     * @return The area as a double.
     *
     * Go to definition on {@code area()} call in Main.java jumps here.
     * Find references on {@code area} shows all implementations and call sites.
     */
    double area();

    /**
     * Return the display name of the shape.
     *
     * @return A string identifying the shape type.
     */
    String name();
}
