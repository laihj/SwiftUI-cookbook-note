//
//  FFSpilitView.swift
//  cookbook
//
//  Created by laihj on 2023/9/21.
//

import SwiftUI


struct Animal: Hashable {
  let name: String
  let description: String
}


struct FFSpilitView: View {
    let animals = [
        Animal(name: "Coyote", description: "The coyote is a species of canine native to North America..."),
        Animal(name: "Gila Monster", description: "The Gila Monster is a species of venomous lizard native to the southwestern United States..."),
        Animal(name: "Roadrunner", description: "The roadrunner is a fast-running bird found in the southwestern United States and Mexico...")
    ]
    @State private var selectedAnimal: (Animal)? = nil
    @State private var columnVisibility: NavigationSplitViewVisibility = .doubleColumn
    
    
    
    var body: some View {
        NavigationSplitView (columnVisibility: $columnVisibility){
            List(animals, id: \.name, selection: $selectedAnimal) { animal in
                NavigationLink(animal.name, value: animal)
            }
            .navigationTitle("Arizona Animals")
        } detail: {
            DetailView(animal: selectedAnimal ?? animals[0])
        }
        .navigationSplitViewColumnWidth(400)
        .navigationSplitViewStyle(.balanced)
        
    }
}

struct DetailView: View {
  let animal: Animal

  var body: some View {
    VStack {
      Text(animal.name)
        .font(.largeTitle)
      Text(animal.description)
        .font(.body)
    }
    .padding()
    .navigationTitle("Animal Details")
  }
}

#Preview {
    FFSpilitView()
}
