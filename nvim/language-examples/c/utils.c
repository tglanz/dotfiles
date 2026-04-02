#include "utils.h"

// find references on `add` shows usage in main.c
// rename on `add` renames across utils.h, utils.c, and main.c
int add(int a, int b) {
    return a + b;
}

Point make_point(int x, int y) {
    Point p;
    p.x = x;
    p.y = y;
    return p;
}
