//
//  Garden.swift
//  GardenUI
//
//  Created by Ludovic Ollagnier on 25/05/2023.
//

import Foundation

class Garden: ObservableObject {

    @Published private(set) var plants: [Plant]
    var name: String

    init(name: String, plants: [Plant] = []) {
        self.name = name
        self.plants = plants
    }

    func add(newPlant: Plant) {
        // Manual trigger of the publisher
//        objectWillChange.send()
        plants.append(newPlant)
    }

    func remove(plant: Plant) -> Plant? {
        guard let index = plants.firstIndex(of: plant) else { return nil }
        let removed = plants.remove(at: index)
        return removed
    }
}
