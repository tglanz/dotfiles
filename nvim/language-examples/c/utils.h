#ifndef UTILS_H
#define UTILS_H

/**
 * A 2D point with integer coordinates.
 *
 * Hover on Point anywhere it's used to see this definition.
 * Go to definition on Point in main.c jumps here.
 */
typedef struct {
    int x; /**< Horizontal coordinate */
    int y; /**< Vertical coordinate */
} Point;

/**
 * Returns the sum of two integers.
 *
 * @param a First integer.
 * @param b Second integer.
 * @return Sum of a and b.
 *
 * Go to definition on `add` in main.c jumps to utils.c (implementation).
 * Hover shows this docstring and signature without opening the file.
 */
int add(int a, int b);

/**
 * Creates a Point with the given coordinates.
 *
 * @param x Horizontal coordinate.
 * @param y Vertical coordinate.
 * @return A new Point with the specified x and y.
 */
Point make_point(int x, int y);

#endif
