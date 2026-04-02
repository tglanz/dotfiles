#include "geometry.h"
#include <cmath>

// find references on `Circle::area` shows all call sites
// rename on `radius_` renames across this file and the header

Circle::Circle(double radius) : radius_(radius) {}

double Circle::area() const {
    return M_PI * radius_ * radius_;
}

Rectangle::Rectangle(double width, double height)
    : width_(width), height_(height) {}

double Rectangle::area() const {
    return width_ * height_;
}
