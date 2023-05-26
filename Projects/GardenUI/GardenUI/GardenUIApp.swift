//
//  GardenUIApp.swift
//  GardenUI
//
//  Created by Ludovic Ollagnier on 25/05/2023.
//

import SwiftUI

@main
struct GardenUIApp: App {

    @StateObject private var garden: Garden = Garden(name: "Potager")

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack {
                    PlantListView(garden: garden)
                }
                .tabItem {
                    Text("List")
                    Image(systemName: "list.clipboard")
                }
                ShopView()
                    .tabItem {
                        Text("Shop")
                        Image(systemName: "cart")
                    }
                    .environmentObject(garden)
            }
        }
    }
}
