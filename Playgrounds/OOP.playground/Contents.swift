//: # OOP

//: ## Classes et structures

class Animal {
    let name = ""
    var age = 0
}

// Reference Type
class Dog: Animal, Codable {
    func bark() {

    }
}

// Value type
struct Cat {
    var age = 0

    func meow() {

    }
}

var dog1 = Dog()
var dog2 = dog1 // Create a new reference
dog1.age = 1

print(dog1.age) // 1
print(dog2.age) // 1

var cat1 = Cat()
var cat2 = cat1 // Copy the value
cat1.age = 1

print(cat1.age) // 1
print(cat2.age) // 0
