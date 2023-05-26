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

    var body: some View {
        VStack {
            Text("Shop")
            Text(garden.name)
            Text(name)
        }

    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
