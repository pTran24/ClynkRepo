// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Making some changes
//adding another line

class NamedShape {
    var numberOfSides: Double = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "I have \(numberOfSides) sides."
    }
}

var shape = NamedShape(name: "Billy")
shape.numberOfSides = 10
shape.simpleDescription()

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
    func calcArea() -> Double {
        return sideLength * sideLength
    }
}

var square = Square(sideLength: 7, name: "Sue")
square.simpleDescription()
square.calcArea()

class Circle: NamedShape {
    var radius: Double
    let pi = 3.141592
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    override func simpleDescription() -> String {
        return "Cicle with radius of \(radius)."
    }
    
    func calcArea() -> Double {
        return pi * (radius * radius)
    }
}

var circ = Circle(radius: 7, name: "Joe")
circ.simpleDescription()
circ.calcArea()

class EquilateralTriangle: NamedShape{
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
    }
    
    var perimeter: Double {
        get{
            return 3.0 * sideLength
        }
        set{
            //newValue is a special implicit variable in setters
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "AN equilateral stringle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 100, name: "Jeni")
triangle.perimeter
triangle.sideLength
triangle.perimeter = 27
triangle.sideLength



