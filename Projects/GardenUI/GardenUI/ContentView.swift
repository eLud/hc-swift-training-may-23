//
//  ContentView.swift
//  GardenUI
//
//  Created by Ludovic Ollagnier on 25/05/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var name: String = ""
    @State private var price: Double = 0
    @State private var climate: Climate = .shadow
    @State private var numberOfSeeds = 1

    @State private var aBool = true

    @ObservedObject var garden: Garden

    let currencyFormatter: NumberFormatter = {
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.locale = Locale(identifier: "fr_FR")
        return format
    }()

    var body: some View {
        Form {
            TextField("Name", text: $name)
            pickerSection
            TextField("Price", value: $price, formatter: currencyFormatter)
            HStack {
                Stepper("Number of seeds", value: $numberOfSeeds, in: 1...100)
                Text("\(numberOfSeeds)")
            }
            Section {
                Button("Save", action: save)
            }
            DemoBind(value: $numberOfSeeds)
            Text("\(garden.plants.count)")
        }
        .padding()
    }

    private func save() {
        guard !name.isEmpty else { return }
        let plant = Plant(name: name,
                          price: price,
                          numberOfSeeds: numberOfSeeds,
                          climate: climate)
        garden.add(newPlant: plant)
    }

    private var pickerSection: some View {
        Section {
            Picker("Climate", selection: $climate) {
                ForEach(Climate.allCases) { climate in
                    Text(climate.title())
                }
            }
        } footer: {
            Text("This is the climate the plant likes")
        }
    }
}

struct DemoBind: View {

    @Binding var value: Int

    var body: some View {
        HStack {
            Button("Increment") {
                value += 1
            }
            Text("\(value)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(garden: Garden(name: "Potager"))
    }
}
