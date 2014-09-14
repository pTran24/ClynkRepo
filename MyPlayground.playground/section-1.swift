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

let optSquare: Square? = Square(sideLength: 2, name: "Tim")

let sideLength = optSquare?.sideLength
sideLength

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    //Jack is 11 because it's the 11th mentioned case
    case Jack, Queen, King
    func simpleDescription() -> String{
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.toRaw()

//Takes 2 Rank-enum values and compares them
func compareRank(first: Rank, second: Rank) -> String {
    first.simpleDescription()
    second.simpleDescription()
    if first.toRaw() > second.toRaw() {
        return "\(first.simpleDescription()) is larger than \(second.simpleDescription())"
    }
    else {
        return "\(second.simpleDescription()) is larger than \(first.simpleDescription())"
    }
}

compareRank(Rank.King, Rank.Five)

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}


