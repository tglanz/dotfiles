mod math;

use math::{add, Circle, Rectangle, Shape};
// go to definition on `add`, `Circle`, or `Shape` jumps to math.rs
// hover on `Shape` shows the trait definition

fn print_area(shape: &dyn Shape) {
    // hover on `shape` shows type: &dyn Shape
    // go to definition on `area` jumps to the trait definition in math.rs
    println!("area: {}", shape.area());
}

fn main() {
    let result = add(3, 4);
    // hover on `result` shows inferred type: i32
    // rename on `result` renames all uses in scope

    let c = Circle { radius: 5.0 };
    // go to definition on `Circle` jumps to math.rs
    // hover on `c.radius` shows type: f64

    let r = Rectangle { width: 3.0, height: 4.0 };

    print_area(&c);
    // go to definition on `print_area` jumps to its definition above
    // find references on `print_area` shows all call sites

    print_area(&r);
    println!("sum: {result}");

    // code action: rust-analyzer can fill in missing trait impl methods,
    // add missing imports, convert to iterator chains, and more
}
