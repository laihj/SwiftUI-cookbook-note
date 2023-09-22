//
//  checkboxView.swift
//  cookbook
//
//  Created by laihj on 2023/9/21.
//

import SwiftUI

struct checkboxView: View {
    @State private var isChecked: Bool = false
    
    @State private var quantity: Int = 1
    
    var body: some View {
        VStack {
              // 3. Create the Toggle view
              Toggle(isOn: $isChecked) {
                // 4. Add a label for the Toggle
                Text("I agree to the terms and conditions")
              }
              // 5. Add styling to make it look like a checkbox
              .toggleStyle(CheckboxToggleStyle())
              .padding()
            
            Text("How many packets of magic beans?")
                  Stepper(value: $quantity, in: 1...10) {
                      Text("\(quantity)")
                  }
                  .padding(.horizontal, 100)
            
            }
        
    }
}

struct CheckboxToggleStyle: ToggleStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    HStack {
      configuration.label
      Spacer()
        withAnimation {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
              .resizable()
              .frame(width: 24, height: 24)
              .onTapGesture { configuration.isOn.toggle() }
        }

    }
  }
}

#Preview {
    checkboxView()
}
