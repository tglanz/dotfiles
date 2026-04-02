// Cross-file LSP features (find references, rename across files) require
// a compile_commands.json in the project root so clangd knows all files.
// Build systems generate this automatically:
//   cmake:  cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
//   make:   bear -- make
//   manual: bear -- gcc main.c utils.c -o main

#include <stdio.h>
#include <stdlib.h>
#include "utils.h"

// go to definition on `Point` jumps to utils.h
// go to definition on `add` jumps to utils.c (the implementation)
// hover on `Point` shows the struct layout

int main(void) {
    int result = add(3, 4);
    // rename on `result` renames all occurrences in this scope

    Point p = make_point(1, 2);
    // hover on `p` shows type: Point
    // hover on `p.x` shows type: int

    int *arr = malloc(5 * sizeof(int));
    // go to definition on `malloc` jumps into the stdlib header
    // hover shows: void *malloc(size_t size)
    // code action: clangd suggests fixes for null-check, cast, etc.

    if (arr == NULL) return 1;

    free(arr);
    printf("result=%d point=(%d,%d)\n", result, p.x, p.y);
    return 0;
}
