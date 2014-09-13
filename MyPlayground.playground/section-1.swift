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