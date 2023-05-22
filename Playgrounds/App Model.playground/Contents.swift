import Foundation

enum Climate {
    case sun
    case shadow
    case mixed
}

struct Plant: Hashable {

    let name: String
    let plantationDate: Date
    var isGerminated: Bool

    let climate: Climate

    var price: Double
    var numberOfSeeds: Int
}

class Garden {

    var plants: [Plant] = []
    var name: String = ""

    func add(newPlant: Plant) {
        plants.append(newPlant)
    }
}

var climate = Climate.sun
climate = .shadow


