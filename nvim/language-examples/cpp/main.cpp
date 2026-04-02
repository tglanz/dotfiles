// Cross-file LSP features (find references, rename across files) require
// a compile_commands.json in the project root so clangd knows all files.
// Build systems generate this automatically:
//   cmake:  cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
//   make:   bear -- make
//   manual: bear -- g++ main.cpp geometry.cpp -o main

#include <iostream>
#include <memory>
#include "geometry.h"

// go to definition on `Shape` jumps to geometry.h
// go to definition on `Circle::area` jumps to geometry.cpp
// hover on `Shape` shows virtual class layout

int main() {
    std::unique_ptr<Shape> c = std::make_unique<Circle>(5.0);
    // hover on `c` shows type: std::unique_ptr<Shape>
    // go to definition on `make_unique` jumps into the STL header

    std::unique_ptr<Shape> r = std::make_unique<Rectangle>(3.0, 4.0);

    double a = c->area();
    // go to definition on `area` shows the virtual dispatch chain
    // find references on `area` shows all call sites across files

    std::cout << "circle area: " << a << "\n";
    std::cout << "rect area:   " << r->area() << "\n";

    // code action: clangd can suggest `auto` for verbose types above
    // rename on `c` renames all uses in this scope
    return 0;
}
