//
//  AnimateImageView.swift
//  cookbook
//
//  Created by laihj on 2023/9/19.
//

import SwiftUI

struct AnimateImageView: View {
    @State private var isAnimating = false
    var body: some View {
        Image("HelloHedgy")
            .resizable()
            .scaledToFit()
            .scaleEffect(isAnimating ? 1.5 : 1.0)
            .onAppear() {
                withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                    isAnimating = true
                }
            }
        
    }
}

#Preview {
    AnimateImageView()
}
