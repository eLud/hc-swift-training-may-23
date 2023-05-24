//
//  Plant.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 23/05/2023.
//

import Foundation

enum Climate: Int, CaseIterable {
    case sun
    case shadow
    case mixed

    func title() -> String {
        switch self {
        case .sun:
            return "Sun"
        case .shadow:
            return "Shadow"
        case .mixed:
            return "Mixed"
        }
    }
}

struct Plant: Hashable {

    enum GerminationStatus: Hashable {
        case notGerminated
        case germinated(at: Date) // Associated value
        case grownUp
    }

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
