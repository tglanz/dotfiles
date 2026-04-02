// go to definition on `Shape`, `Circle`, or `Rectangle` in main.ts jumps here
// hover on any symbol shows its type signature

export interface Shape {
    // go to definition on `area` call in main.ts jumps here
    area(): number;
    name: string;
}

export class Circle implements Shape {
    name = "circle";

    constructor(public radius: number) {}

    // find references on `area` shows all call sites across files
    area(): number {
        return Math.PI * this.radius ** 2;
    }
}

export class Rectangle implements Shape {
    name = "rectangle";

    constructor(public width: number, public height: number) {}

    area(): number {
        return this.width * this.height;
    }
}

export function add(a: number, b: number): number {
    return a + b;
}
