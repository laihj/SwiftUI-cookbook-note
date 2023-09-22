//
//  ImageView.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
          Text("Cropping With Clipped")
            .font(.title)
          Image("original") // Load the image
            .resizable()
            .scaledToFit()
//            .scaledToFill()
            .frame(width: 400, height: 400) // Set the frame size
            .clipped() // Crop the image to the frame size
            .border(.black, width: 2) // Add a border for visual clarity
            Image(systemName: "bell")
                  .font(.largeTitle)
                  .symbolVariant(.square)
                  .foregroundColor(.blue)
        }
    }
}

#Preview {
    ImageView()
}
