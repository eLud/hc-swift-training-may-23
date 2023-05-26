//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by Ludovic Ollagnier on 26/05/2023.
//

import SwiftUI

@main
struct CoreDataDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
