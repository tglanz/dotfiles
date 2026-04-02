import java.util.List;

/**
 * Entry point demonstrating LSP features across multiple files.
 *
 * Hover on any type to see its Javadoc.
 * Go to definition on {@code Shape} jumps to Shape.java.
 * Go to definition on {@code Circle} jumps to Circle.java.
 */
public class Main {

    /**
     * Return the sum of two integers.
     *
     * @param a First integer.
     * @param b Second integer.
     * @return The sum of a and b.
     */
    static int add(int a, int b) {
        return a + b;
    }

    /**
     * Print the area of a shape to stdout.
     *
     * @param shape The shape whose area to print.
     *
     * Hover on {@code shape} shows type: Shape.
     * Go to definition on {@code area()} jumps to Shape.java (the interface).
     */
    static void printArea(Shape shape) {
        System.out.printf("%s area: %.2f%n", shape.name(), shape.area());
    }

    /**
     * Main entry point.
     *
     * @param args Command-line arguments (unused).
     */
    public static void main(String[] args) {
        int result = add(3, 4);
        // rename on `result` renames all uses in this scope

        Circle c = new Circle(5.0);
        // go to definition on `Circle(...)` jumps to Circle.java constructor
        // hover on `c` shows type: Circle

        Rectangle r = new Rectangle(3.0, 4.0);

        List<Shape> shapes = List.of(c, r);
        // hover on `shapes` shows type: List<Shape>
        // go to definition on `List` jumps into the JDK source

        for (Shape s : shapes) {
            printArea(s);
            // find references on `printArea` shows all call sites
        }

        System.out.println("sum: " + result);

        // code action: jdtls can generate getters/setters, implement
        // interface methods, organize imports, extract variables, and more
    }
}
