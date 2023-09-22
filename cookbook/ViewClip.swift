//
//  ViewClip.swift
//  cookbook
//
//  Created by laihj on 2023/9/16.
//

import SwiftUI

struct ViewClip: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 200, height: 100)
                    .font(.title)
                    .padding()
                    .background(.purple)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
        
        Text("Custom")
                .frame(width: 200, height: 100)
                .font(.title)
                .padding()
                .background(.yellow)
                .clipShape(CustomShape2())
                .border(Color.black)
        
        Text("Hello,\nCircular View!")
              .multilineTextAlignment(.center)
              .padding(50)
              .foregroundColor(.white)
              .background(
                Circle()
                  .fill(Color.blue)
                  .frame(width: 200, height: 200)
              )
              .clipped()
              .border(Color.black)
    }
}

struct CustomShape2: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.closeSubpath()
//    path.border(Color.black, width: 2)
    return path
  }
}

#Preview {
    ViewClip()
}
