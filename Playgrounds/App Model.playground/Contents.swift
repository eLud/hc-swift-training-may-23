import Foundation

enum Climate {
    case sun
    case shadow
    case mixed
}

enum GerminationStatus: Hashable {
    case notGerminated
    case germinated(at: Date) // Associated value
    case grownUp
}

struct Plant: Hashable {

    init(name: String, price: Double, numberOfSeeds: Int, climate: Climate? = nil) {
        self.name = name // self == this
        self.price = price
        self.numberOfSeeds = numberOfSeeds
        self.climate = climate

        plantationDate = .now
        germinationStatus = .notGerminated
    }

    let name: String
    let plantationDate: Date
    var germinationStatus: GerminationStatus

    let climate: Climate?

    var price: Double
    var numberOfSeeds: Int

    mutating func setGerminationDate() {
        guard germinationStatus == .notGerminated else { return }
        germinationStatus = .germinated(at: Date())
    }

    func doNothing() {

    }
}

class Garden {

    private(set) var plants: [Plant]
    var name: String

    init(name: String, plants: [Plant] = []) {
        self.name = name
        self.plants = plants
    }

    func add(newPlant: Plant) {
        plants.append(newPlant)
    }

    func remove(plant: Plant) -> Plant? {
        guard let index = plants.firstIndex(of: plant) else { return nil }
        return plants.remove(at: index)
    }
}

var climate = Climate.sun
climate = .shadow

let myPlant = Plant(name: "Fraise", price: 0.0, numberOfSeeds: 3)

// myPlant.setGerminationDate()
// Cannot use mutating member on immutable value: 'myPlant' is a 'let' constant
myPlant.doNothing()

let potager = Garden(name: "Potager")
potager.add(newPlant: myPlant)
print(potager.plants)
// potager.plants.append(myPlant)
// Cannot use mutating member on immutable value: 'plants' setter is inaccessible
