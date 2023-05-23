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

let value = isAwesome ? "Awesome" : "Bad"
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


//: # Functions
func add(_ firstValue: Int, to secondValue: Int = 0) -> Int {
    firstValue + secondValue

}

add(5, to: 5)

//add(10)
add(10, to: 10)

func loadURL() -> (code: Int, message: String) {
    (200, "OK")
}

let result = loadURL()
result.message
result.0

let (code, text) = loadURL()

//: # Optionnels
let capitales = ["France": "Paris", "Canada": "Ottawa"]
let capIrlande: Optional<String> = capitales["Irlande"]
let capFrance: Optional<String> = capitales["France"]

// Forced unwrap (!)

//let unwrappedValue = capIrlande!
//Fatal error: Unexpectedly found nil while unwrapping an Optional value
//print(unwrappedValue)

if let capIrlande = capIrlande {
    print(capIrlande)
}

// Syntaxe plus récentes du if-let (5.7+)
if let capIrlande {
    print(capIrlande)
} else {

}

let up: String? = capFrance?.first?.uppercased()

guard let capitaleFrance = capFrance else { fatalError() }
capitaleFrance

capFrance
guard let capFrance else { fatalError() } // Syntaxe plus récentes du guard-let (5.7+)

capFrance
