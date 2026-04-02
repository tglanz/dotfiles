package main

import (
    "fmt"
    "example/math"
)

// go to definition on `math.Add` jumps to math/math.go
// go to definition on `math.Shape` jumps to the interface definition
// hover on any symbol from the math package shows its doc comment

func printArea(s math.Shape) {
    // hover on `s` shows type: math.Shape
    // go to definition on `Area` jumps to the interface in math/math.go
    fmt.Printf("area: %f\n", s.Area())
}

func main() {
    result := math.Add(3, 4)
    // hover on `result` shows inferred type: int
    // rename on `result` renames all uses in this scope

    c := math.Circle{Radius: 5.0}
    // go to definition on `Circle` jumps to math/math.go
    // hover on `c.Radius` shows type: float64

    r := math.Rectangle{Width: 3.0, Height: 4.0}

    printArea(c)
    // find references on `printArea` shows all call sites

    printArea(r)
    fmt.Println("sum:", result)

    // code action: gopls can auto-add missing imports, fill struct fields,
    // implement interface methods, and extract functions
}
