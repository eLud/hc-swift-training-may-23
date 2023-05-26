//
//  CustomSwitchView.swift
//  GardenUI
//
//  Created by Ludovic Ollagnier on 26/05/2023.
//

import SwiftUI

struct CustomSwitchView: View {

    @Binding var isOn: Bool
    let symbolName: String

    var body: some View {
        Capsule()
            .foregroundColor(isOn ? .green : .gray)
            .frame(width: 49, height: 31)
            .overlay(alignment: isOn ? .trailing : .leading) {
                thumb
            }
            .onTapGesture {
                withAnimation {
                    isOn.toggle()
                }
            }
            .animation(.easeInOut(duration: 0.2), value: isOn)
    }

    private var thumb: some View {
        Circle()
            .padding(2)
            .foregroundColor(.white)
            .overlay {
                Image(systemName: symbolName)
                    .opacity(isOn ? 1 : 0.2)
            }
    }
}

struct CustomSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomSwitchView(isOn: .constant(false), symbolName: "firewall")
            CustomSwitchView(isOn: .constant(true), symbolName: "flag.checkered.circle")
        }
    }
}
