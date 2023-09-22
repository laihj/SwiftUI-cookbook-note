//
//  FilterImage.swift
//  cookbook
//
//  Created by laihj on 2023/9/19.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct FilterImage: View {
    let image:Image
    @State var isSelected = false
    
    init() {
        let uiImage = UIImage(named: "original") ?? UIImage()
        let filteredUIImage = FilterImage.applySepiaFilter(to: uiImage)
        image = Image(uiImage: filteredUIImage)
    }
    
    var body: some View {
        Button(action: {
              isSelected.toggle()
            }) {
              Image("TransparentHedgy")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .foregroundColor(isSelected ? .brown : .gray)
            }
//        image// Load the image
//          .resizable()
////          .scaledToFit()
//          .scaledToFill()
//          .frame(width: 400, height: 400) // Set the frame
    }
    
    static func applySepiaFilter(to inputImage: UIImage) -> UIImage {
        guard let ciImage = CIImage(image: inputImage) else {
            return  inputImage
        }
        
        let filter = CIFilter.sepiaTone()
        filter.inputImage = ciImage
        filter.intensity = 1.0
        let context = CIContext()
        
        guard let outputCIImage = filter.outputImage,
              let cgImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) else {
            return inputImage
        }
        
        let outputUIImage = UIImage(cgImage: cgImage)
        
        return outputUIImage
    }
}

#Preview {
    FilterImage()
}
