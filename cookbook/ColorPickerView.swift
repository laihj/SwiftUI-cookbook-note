//
//  ColorPicker.swift
//  cookbook
//
//  Created by laihj on 2023/9/21.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State private var colorChoice = Color.red
    
    var body: some View {
        VStack {
            ColorPicker("Choose your color", selection: $colorChoice)
                    .padding()

              Text("You chose:")
                .font(.title)

              Rectangle()
                .fill(colorChoice)
                .frame(width: 100, height: 100)
                .padding()
            }
    }
}

#Preview {
    ColorPickerView()
}
