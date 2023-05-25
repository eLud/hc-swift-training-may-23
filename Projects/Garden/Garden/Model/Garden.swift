//
//  Garden.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 23/05/2023.
//

import Foundation

class Garden {

    private(set) var plants: [Plant]
    var name: String

    let notCenter = NotificationCenter.default

    init(name: String, plants: [Plant] = []) {
        self.name = name
        self.plants = plants
    }

    func add(newPlant: Plant) {
        plants.append(newPlant)

        notCenter.post(name: Notification.Name(Constants.Notifications.modelUpdated), object: self)
    }

    func remove(plant: Plant) -> Plant? {
        guard let index = plants.firstIndex(of: plant) else { return nil }
        let removed = plants.remove(at: index)
        notCenter.post(name: Notification.Name(Constants.Notifications.modelUpdated), object: self)
        return removed
    }
}
