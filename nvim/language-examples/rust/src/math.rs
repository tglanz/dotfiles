// go to definition on `math::add` or `math::Shape` in main.rs jumps here
// find references on `area` shows all call sites across the project

pub fn add(a: i32, b: i32) -> i32 {
    a + b
}

pub trait Shape {
    // go to definition on `area` call in main.rs jumps here
    // hover shows the trait definition and all implementors
    fn area(&self) -> f64;
}

pub struct Circle {
    pub radius: f64,
}

pub struct Rectangle {
    pub width: f64,
    pub height: f64,
}

impl Shape for Circle {
    fn area(&self) -> f64 {
        std::f64::consts::PI * self.radius * self.radius
    }
}

impl Shape for Rectangle {
    fn area(&self) -> f64 {
        self.width * self.height
    }
}
