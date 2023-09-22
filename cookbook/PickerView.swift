//
//  PickerView.swift
//  cookbook
//
//  Created by laihj on 2023/9/21.
//

import SwiftUI

struct PickerView: View {
    let options = ["Frida Kahlo", "Georgia O'Keeffe", "Mary Cassatt", "Lee Krasner", "Helen Frankenthaler"]
    @State private var selectedOption = 0
    
    @State private var selectedDate = Date()

    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "paintpalette")
                          .foregroundColor(.blue)
                          .padding(.trailing, 4)
                Text("Favorite artist:")
                          .font(.title)
                          .lineLimit(1)
                Text(options[selectedOption])
                          .font(.title)
                          .padding(.leading, 4)
            }.padding()
            
            Picker("Options", selection: $selectedOption) {
                ForEach(options.indices, id: \.self) { index in
                          Text(options[index])
                            .font(.largeTitle)
                        }
            }.font(.largeTitle)
                .pickerStyle(.segmented)
                .padding()
        }
        VStack {
              Text("Selected date is: \(selectedDate)")

              DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .padding()
            }
            .padding()
    }
}

#Preview {
    PickerView()
}
