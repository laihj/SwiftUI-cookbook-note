//
//  Gesture.swift
//  cookbook
//
//  Created by laihj on 2023/12/9.
//

import SwiftUI

struct Gesture: View {
    @State private var countdown = 10
    @State private var circlePosition = CGPoint(x: 100, y: 100)
    
    @GestureState private var rotationState:GestureState = .init(initialValue: 1)
    
    var body: some View {
//        let guesture = LongPressGesture()
//            .sequenced(before: TapGesture())
//            .sequenced(before: DragGesture())
//            .updating($rotationState) { value, state, _ in
//                switch value {
//
//                case .first(_):
//                    <#code#>
//                case .second(_, _):
//                    <#code#>
//                }
//            }
        
        
        VStack {
              Image(systemName: "arrowtriangle.up.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.orange.gradient)
            
              
              Text("\(countdown) until launch")
                .padding()
            }
        .position(circlePosition)
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .local )
                .onChanged { gesture in
                    self.circlePosition = gesture.location
                }
        )
        
            .onTapGesture {
              if self.countdown > 0 {
                self.countdown -= 1
              }
            }
            .onLongPressGesture {
                print("longpress")
                if self.countdown > 0 {
                  self.countdown -= 2
                }
            }
    }
}

#Preview {
    Gesture()
}
