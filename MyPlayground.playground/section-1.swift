// Playground - noun: a place where people can play

import UIKit
let name = "Mr. Awesome"
name

var str = "Hello, playground"

class NamedShape { //Base class to be extended
    var numberOfSides: Double = 0 //default size of shape
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
shape.name

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

let optSquare: Square? = Square(sideLength: 0, name: "Tim")

let sideLength = optSquare?.sideLength
sideLength

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King //two is 2 becuase it is the next  case mentioned after 1
    //Jack is 11 because it's the 11th mentioned case
    //case Jack, Queen, King
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
            return String(self.rawValue) //“Use the rawValue property to access the raw value of an enumeration member”
        }
    }
}

let ace = Rank.Ace
let myQueen = Rank.Queen
let queenvalue = myQueen.rawValue
let aceRawValue = ace.rawValue

//Takes 2 Rank-enum values and compares them. Outputs string.
func compareRank(first: Rank, second: Rank) -> String {
    first.simpleDescription()
    second.simpleDescription()
    
    if first.rawValue > second.rawValue {
        return "\(first.simpleDescription()) is larger than \(second.simpleDescription())"
    }
    else {
        return "\(second.simpleDescription()) is larger than \(first.simpleDescription())"
    }
}

compareRank(Rank.Ace, Rank.Ace)

enum Suit {
    case Spades, Diamonds, Clubs, Hearts
    func simpleDesciption() -> String {
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
    func color() -> String {
        if (self.simpleDesciption() == "hearts" || self.simpleDesciption() == "diamonds") {
            return "red"
        }
        else {
            return "black"
        }
    }
}

let hearts = Suit.Diamonds
let heartsDesc = hearts.simpleDesciption()
hearts.color()

//“structures are always copied when they are passed around in your code, but classes are passed by reference.”
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDesciption())"
    }
}
func createDeck() -> [Card] {
    let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six, Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
    let suits = [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs]
    var deck = [Card]()
    for suit in suits {
        for rank in ranks {
            var currCard = Card(rank: rank, suit: suit)
            deck.append(currCard)
            //deck.append(Card(rank: rank, suit: suit))
        }
    }
    return deck
}

var myNewDeck : [Card] = createDeck()
for myCard in myNewDeck{
    myCard.simpleDescription()
}

let randomNum = arc4random_uniform(5)


for num in 1...4 {
    println("hello")
}









let threeOfSpades = Card(rank: .Three, suit: .Spades)
threeOfSpades.simpleDescription()
//var deck = threeOfSpades.createDeck()
//
//for card in deck {
//    println(card.simpleDescription())
//}

class CardClass { //just an example to show how classes are pass by reference
    var rank: Rank
    var suit: Suit
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDesciption())"
    }
}


//example of how classes are pass by references
let queenOfDiamonds = CardClass(rank: .Queen, suit: .Diamonds)
queenOfDiamonds.simpleDescription()
queenOfDiamonds.rank = .King
queenOfDiamonds.simpleDescription()

let fourOfDiamonds = queenOfDiamonds
fourOfDiamonds.simpleDescription()
fourOfDiamonds.rank = .Ace
fourOfDiamonds.simpleDescription()
queenOfDiamonds.simpleDescription()

//Command + CTRL + Space = Character Map

//p41
enum ServerResponse {
    case Result(String, String)
    case Error(String)
    case Moo(Int)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")
let cow = ServerResponse.Moo(10)

switch cow {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
case let .Moo(someNum):
    let serverResponse = "Mooo! \(someNum)"
}


//Learning Protocal
protocol ExampleProtocal {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocal {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Not 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocal {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription




