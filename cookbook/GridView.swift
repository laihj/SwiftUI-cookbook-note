//
//  GridView.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import SwiftUI

struct GridView: View {
    let items = ["inter","milan","juve","roma","lazio","12",""]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 2,content: {
            ForEach(items, id:\.self) { item in
                Text(item)
                    .frame(maxWidth:.infinity)
                    .background(.blue)
                    .foregroundColor(.white)
            }
        }).frame(height: 100)
        .padding()
    }
}

#Preview {
    GridView()
}
