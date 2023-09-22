//
//  ShowCircleProgressView.swift
//  cookbook
//
//  Created by laihj on 2023/9/22.
//

import SwiftUI

struct ShowCircleProgressView: View {
    
    @State private var progress: CGFloat = 0.2
    
    var body: some View {
        CircularProgressView(progress: progress)
          .frame(width: 200, height: 200) // adjust size as needed

        Slider(value: $progress, in: 0...1) // Slider to adjust progress for demonstration
          .padding()
    }
}

struct CircularProgressView: View {
    let progress: CGFloat
    
    var body: some View {
        ZStack {
            // Background for the progress bar
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.1)
                .foregroundColor(.blue)
            
            // Foreground or the actual progress bar
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
        }
    }
}

#Preview {
    ShowCircleProgressView()
}
