//
//  SlideView.swift
//  cookbook
//
//  Created by laihj on 2023/9/21.
//

import SwiftUI

struct SlideView: View {
    @State private var value: Double = 0.5
    
    var body: some View {
        VStack {
              Slider(value: $value, in: 0...1)
              Text("Value: \(value, specifier: "%.2f")")
            }
    }
}

#Preview {
    SlideView()
}
