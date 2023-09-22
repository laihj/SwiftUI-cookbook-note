//
//  blendImageView.swift
//  cookbook
//
//  Created by laihj on 2023/9/19.
//

import SwiftUI

struct blendImageView: View {
    var body: some View {
        ZStack {
            Image("SunriseTent")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("WavyPattern")
                .resizable()
                .scaledToFill()
                .blendMode(.darken)
                .opacity(1.0)
            
            
        }
    }
}

#Preview {
    blendImageView()
}
