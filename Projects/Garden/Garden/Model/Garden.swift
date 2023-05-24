//
//  Garden.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 23/05/2023.
//

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
