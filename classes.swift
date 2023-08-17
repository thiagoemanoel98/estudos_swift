class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape();
shape.numberOfSides = 7;
var shapeDescription = shape.simpleDescription();

// Superclass
class NamedShape {
    var numberOfSides: Int = 0;
    let name: String;
    
    init(name: String) {
        self.name = name;
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides.";
    }
}
var namedShape = NamedShape(name: "shape");
namedShape.numberOfSides = 7;
var namedShapeDescription = namedShape.simpleDescription();

// Subclass
class Square: NamedShape {
    var sideLength: Double;
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength;
        super.init(name: name);
        numberOfSides = 4;
    }
    
    func area() -> Double {
        return sideLength * sideLength;
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)";
    }
}
let square = Square(sideLength: 5.2, name: "my test square");
print(square.area());
print(square.simpleDescription());

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength;
        super.init(name: name);
        numberOfSides = 3;
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength;
        }
        set {
            sideLength = newValue / 3.0;
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter);
triangle.perimeter = 9.9;
print(triangle.sideLength);

class TrianguleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength;
        }
    }

    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength;
        }
    }

    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name);
        triangle = EquilateralTriangle(sideLength: size, name: name);
    }
}

var trianguleAndSquare = TrianguleAndSquare(size: 10, name: "another teste shape");
print(trianguleAndSquare.square.sideLength);
print(trianguleAndSquare.triangle.sideLength);

trianguleAndSquare.square = Square(sideLength: 50, name: "larger");

print(trianguleAndSquare.triangle.sideLength);
