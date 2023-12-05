//
//  TextViewFrame.swift
//  cookbook
//
//  Created by laihj on 2023/12/5.
//

import SwiftUI

struct TextViewFrame: View {
    var body: some View {
        VStack {
          Text("Hello, SwiftUI!")
            .font(.largeTitle)
            .frame(width: 300, height: 200, alignment: .bottomTrailing)
            .border(Color.red)
            
            MoonPhaseView(phase: "Waxing Crescent", image: Image(systemName: "moonphase.waxing.crescent"))
                  .frame(maxWidth: 100)
            

              // Define your grid layout first
              let rows = [
                GridItem(.fixed(100)),
                GridItem(.flexible())
              ]
              // Then create a LazyHGrid using the layout
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 20) {
                    ForEach(0..<10) { index in
                        Text("Item \(index)")
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct MoonPhaseView: View {
  var phase: String
  var image: Image

  var body: some View {
    ViewThatFits {
        Text("hhhhhh")
            .font(.system(size: 50))
            .lineLimit(1)
        Text("hhhhhh")
            .font(.system(size: 20))
            .lineLimit(1)
    }
    .padding()
  }
}

#Preview {
    TextViewFrame()
}
