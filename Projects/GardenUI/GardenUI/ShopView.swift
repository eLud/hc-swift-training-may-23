//
//  ShopView.swift
//  GardenUI
//
//  Created by Ludovic Ollagnier on 25/05/2023.
//

import SwiftUI

struct ShopView: View {

    @EnvironmentObject var garden: Garden
    @AppStorage("lastName") private var name: String = ""

    @State private var result = ""

    var body: some View {
        VStack {
            Text("Shop")
            Text(garden.name)
            Text(name)
            TextEditor(text: $result)
            Button("Call URL") {
                Task {
                    await networkRequest()
                }
            }
        }
        .task {
            await networkRequest()

        }
    }

    @MainActor
    private func networkRequest() async {
        // URLSession

        let session = URLSession.shared
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon")!
        let request = URLRequest(url: url)

        
//        let task = session.dataTask(with: request) { data, resp, error in
//            guard let data, let string = String(data: data, encoding: .utf8) else { return }
//
//            DispatchQueue.main.async {
//                result = string
//            }
//        }
//        task.resume()

        do {
            let data = try await session.data(for: request)
            guard let string = String(data: data.0, encoding: .utf8) else { return }
            result = string
        } catch {
            print(error)
        }

    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
            .environmentObject(Garden(name: ""))
    }
}
