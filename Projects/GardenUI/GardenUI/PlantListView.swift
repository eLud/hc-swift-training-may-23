//
//  PlantListView.swift
//  GardenUI
//
//  Created by Ludovic Ollagnier on 25/05/2023.
//

import SwiftUI

struct PlantListView: View {

    @ObservedObject var garden: Garden
    @State private var showForm = false

    var body: some View {
        List {
            Section {
                ForEach(garden.plants) { plant in
                    NavigationLink {
                        PlantDetailsView(plant: plant)
                    } label: {
                        PlantCell(plant: plant)
                    }
                }
                .onDelete { index in
                    garden.remove(at: index)
                }
                .onMove { indexSet, offset in
                    garden.move(at: indexSet, offset: offset)
                }
            }
            Button("Add") {
                garden.add(newPlant: Plant(name: "Random", price: 0.6, numberOfSeeds: 5))
            }
        }
        .navigationTitle(Text("List"))
        .toolbar {
            ToolbarItem {
                Button {
                    showForm.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showForm) {
            ContentView(garden: garden)
                .presentationDetents([.medium, .large])
        }
    }
}

struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlantListView(garden: Garden(name: "Potager"))
        }
    }
}

struct PlantCell: View {

    let plant: Plant

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "leaf")
                .font(.headline)
                .foregroundColor(.blue)
            VStack(alignment: .leading) {
                Text(plant.name)
                Text(plant.climate?.title() ?? "No climate value")
                    .font(.caption)
            }
        }
        .padding(1)
    }
}
