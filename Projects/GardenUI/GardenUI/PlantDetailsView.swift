//
//  PlantDetailsView.swift
//  GardenUI
//
//  Created by Ludovic Ollagnier on 25/05/2023.
//

import SwiftUI

struct PlantDetailsView: View {

    let plant: Plant

    var body: some View {
        Text(plant.name)
            .font(.title)
            .navigationTitle(plant.name)
    }
}

struct PlantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailsView(plant: Plant(name: "Tomates", price: 0.5, numberOfSeeds: 3))
    }
}
