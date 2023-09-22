//
//  CustomShape.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import SwiftUI

struct CustomShape: View {
    var body: some View {
        DiamandShape()
            .fill(.red)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
    }
}

struct DiamandShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width / 2.0, y: rect.height / 2.0)
        
        path.move(to: CGPoint(x: center.x, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: center.y))
        path.addLine(to: CGPoint(x: center.x, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: center.y))
        
        return path
    }
}

#Preview {
    CustomShape()
}
