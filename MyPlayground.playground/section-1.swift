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
        return "My name is \(name)."
    }
}

var shape = NamedShape(name: "Billy")
shape.numberOfSides = 10
shape.simpleDescription()
println(shape.numberOfSides)
