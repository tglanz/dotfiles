package math

import "math"

// go to definition on `math.Add` or `math.Circle` in main.go jumps here
// hover on any exported symbol shows its doc comment

// Add returns the sum of two integers.
func Add(a, b int) int {
    return a + b
}

// Shape is implemented by any type with an Area method.
// go to definition on the Shape interface in main.go jumps here
type Shape interface {
    Area() float64
}

type Circle struct {
    Radius float64
}

// find references on `Area` shows all implementations and call sites
func (c Circle) Area() float64 {
    return math.Pi * c.Radius * c.Radius
}

type Rectangle struct {
    Width, Height float64
}

func (r Rectangle) Area() float64 {
    return r.Width * r.Height
}
