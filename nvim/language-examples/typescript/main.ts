import { add, Circle, Rectangle, Shape } from "./shapes";
// go to definition on `Shape`, `Circle`, `add` jumps to shapes.ts
// hover on any import shows its type

function printArea(shape: Shape): void {
    // hover on `shape` shows type: Shape
    // go to definition on `area` jumps to the interface in shapes.ts
    console.log(`${shape.name} area: ${shape.area()}`);
}

const result = add(3, 4);
// hover on `result` shows inferred type: number
// rename on `result` renames all uses in this file

const c = new Circle(5);
// go to definition on `Circle` jumps to shapes.ts
// hover on `c.radius` shows type: number
// find references on `Circle` shows all usages across the project

const r = new Rectangle(3, 4);

printArea(c);
// find references on `printArea` shows all call sites
printArea(r);

console.log("sum:", result);

// code action: ts-ls can add missing imports, infer return types,
// convert to async/await, extract to function, fix type errors
