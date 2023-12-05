//
//  ListView.swift
//  cookbook
//
//  Created by laihj on 2023/10/12.
//

import SwiftUI

struct ListView: View {
    @State var items = Array(1...600)

    var body: some View {
        VStack {
            Button("Shuffle") {
                self.items.shuffle()
            }
            
            ViewThatFits {
                Text("Hi")
                    .fixedSize(horizontal: true, vertical: false)
            }
            .frame(width: 5)
            
            Text("Hello World!fff")
                        .visualEffect { initial, geometry in
                            initial
//                                .blur(radius: 8)
                                .opacity(0.5)
                                .scaleEffect(.init(width: 20, height: 20))
                        }

            List(items, id: \.self) {
                Text("Item \($0)")
            }
        }
    }
}

#Preview {
    ListView()
}
