//
//  animation.swift
//  cookbook
//
//  Created by laihj on 2023/12/5.
//

import SwiftUI

struct animation: View {
    
    @State private var rotate = false
    
    @State private var angle: Double = 0.0

    var body: some View {
      VStack {
        Button(action: {
          rotate.toggle()
        }) {
          Text("Rotate")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .cornerRadius(10)
        }
        .rotation3DEffect(.degrees(rotate ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .animation(.easeInOut(duration: 0.5), value: rotate)
          
          Rectangle()
            .foregroundColor(.blue)
            .frame(width: 150, height: 150)
            .rotationEffect(.degrees(angle))
            .onTapGesture {
              angle += 360
            }
            .animation(.spring(response: 0.5, dampingFraction: 0.4), value: angle)
      }
    }
    
//    @State var offset = CGSize(width: 0, height: 0)
//
//    var body: some View {
//      Image(systemName: "arrow.up")
//        .font(.largeTitle)
//        .offset(offset)
//        .animation(.spring(), value: offset)
//        .gesture(
//          DragGesture()
//            .onChanged { value in
//              offset = value.translation
//            }
//            .onEnded { _ in
//              withAnimation {
//                offset = .zero
//              }
//            }
//        )
//    }
    
    
//    @State private var opacity: Double = 0.0
//
//      var body: some View {
//        VStack {
//          Text("Hello, SwiftUI!")
//            .opacity(opacity)
//            .font(.largeTitle)
//            .padding()
//          
//          Button(opacity == 0.0 ? "Fade In" : "Fade Out") {
//            withAnimation(.easeInOut(duration: 2)) {
//              opacity = opacity == 0.0 ? 1.0 : 0.0
//            }
//          }
//        }
//      }
    
    
//    @State private var isAnimated = false
//      
//      var body: some View {
//        RoundedRectangle(cornerRadius: 20)
//          .fill(.blue)
//          .frame(width: isAnimated ? 200 : 100, height: 100)
//          .animation(.linear(duration: 1), value: isAnimated)
//          .onTapGesture {
//            isAnimated.toggle()
//          }
//      }
}

#Preview {
    animation()
}
