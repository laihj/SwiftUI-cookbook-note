//
//  State.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import SwiftUI

struct StateView: View {
    @State private var isSwitchOn = false
    var body: some View {
        VStack {
            Toggle(isOn: $isSwitchOn) {
                Text("switch is off")
            }.padding()
            if isSwitchOn {
                Text("switch is on")
            } else {
                Text("")
            }
        }
    }
}

#Preview {
    StateView()
}
