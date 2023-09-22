//
//  TabListView.swift
//  cookbook
//
//  Created by laihj on 2023/9/19.
//

import SwiftUI

struct TabListView: View {
    var animals = ["Lion", "Tiger", "Elephant", "Leopard"]
    var plants = ["Rose", "Lily", "Tulip", "Orchid"]
    var body: some View {
      TabView {
        List(animals, id: \.self) { animal in
          Text(animal)
        }
        .tabItem {
          Image(systemName: "hare")
          Text("Animals")
        }

        List(plants, id: \.self) { plant in
          Text(plant)
        }
        .tabItem {
          Image(systemName: "leaf")
          Text("Plants")
        }
      }
    }
}

#Preview {
    TabListView()
}
