//
//  CustomViewModifer.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import SwiftUI

struct CustomViewModifer: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .cusFont()
///            .modifier(BoldAndIitalicModifer())
    }
}

struct BoldAndIitalicModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
    }
    
    
}


extension View {
    func cusFont() -> some View {
        modifier(BoldAndIitalicModifer())
    }
}

#Preview {
    CustomViewModifer()
}
