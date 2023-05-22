//: # Syntaxe et principes de base

print("Hello, World")

//: ## Variables et constantes
let languageName: String = "Swift"
var version: Double = 5.8
let introduced: Int = 2014
let isAwesome: Bool = true

// languageName = "Kotlin"
// Cannot assign to value: 'languageName' is a 'let' constant

//: ## Typage fort

// version = introduced
// Cannot assign value of type 'Int' to type 'Double'

//: ## Inférence de type
let firstName = "Ludovic"

// Préciser si type inféré n'est pas le bon
var height: Float = 1.83
let initial: Character = "L"

// Préciser si pas de valeur
var age: Int

// print(age)
// Variable 'age' used before being initialized
age = 36

//: # Chaines de caractères

let helloString = "Hello"
let worldString = "World 🌏"

// Utilisation de l'opérateur +
var fullString = helloString + ", " + worldString

//let presentation = "Je m'appelle " + firstName + " et j'ai " + age
// Binary operator '+' cannot be applied to operands of type 'String' and 'Int'

// String interpolation
let presentation = "Je m'appelle \(firstName) et j'ai \(age) ans"

helloString.count
helloString.isEmpty
helloString.hasPrefix("Hello")
helloString.uppercased()

worldString.count

for element in worldString {
    print(element)
}

fullString.append("!")
print(fullString)

// Swift 5.7+ type Regex existe
// https://www.hackingwithswift.com/swift/5.7/regexes

let message = "the cat sat on the mat"
print(message.ranges(of: "at"))
print(message.ranges(of: /[a-z]at/))

message.replacing("cat", with: "dog")

//: # Boucles
for element in worldString {
    print(element)
}

// ⚠️ Dans certains cas offset != index
for (offset, element) in worldString.enumerated() {
    print("\(offset): \(element)")
}

worldString.forEach { element in
    print(element)
}

while !isAwesome {
    print("Try to be better")
}

repeat {
    print("Try to be better")
} while !isAwesome


0...10 // De 0 à 10 inclus
0..<10 // De 0 à 10 exclus

for i in 0..<10 {
    print(i)
}

//: # Conditions
//: ## If/Else
if isAwesome {

} else {

}
//: ## Switch
switch languageName {
case "Swift":
    print("It's Swift")
case "Objective-C":
    print("It's Objective-C")
default:
    print("Unknonw language")
}

//: ## Guard
guard isAwesome else {
    fatalError("Swift have to be awesome")
}
print("Swift is awesome")
