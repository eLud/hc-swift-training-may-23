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
        saveGarden()
    }

    func remove(plant: Plant) -> Plant? {
        guard let index = plants.firstIndex(of: plant) else { return nil }
        let removed = plants.remove(at: index)
        return removed
    }

    func remove(at offsets: IndexSet) {
        plants.remove(atOffsets: offsets)
    }

    func move(at offsets: IndexSet, offset: Int) {
        plants.move(fromOffsets: offsets, toOffset: offset)
    }

    private func saveGarden() {
        let encoder = JSONEncoder()
        // Do-Catch
        do {
            let data = try encoder.encode(plants)
            guard let jsonString = String(data: data, encoding: .utf8) else { return }
            print(jsonString)
            decodePlantArray(from: data)
        } catch {
            print(error)
        }

//        Transforme l'erreur en optionnel
//        let data = try? encoder.encode(plants)
    }

    private func decodePlantArray(from data: Data) {
        let decoder = JSONDecoder()
        guard let plantArray = try? decoder.decode([Plant].self, from: data) else { return }
        print(plantArray)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        plants = try container.decode([Plant].self, forKey: .plants)
        name = try container.decode(String.self, forKey: .name)
    }
}

extension Garden: Codable {

    enum CodingKeys: String, CodingKey {
        case plants
        case name
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(plants, forKey: .plants)
        try container.encode(name, forKey: .name)
    }
}
