//
//  AlignmentGuide.swift
//  cookbook
//
//  Created by laihj on 2023/12/5.
//

import SwiftUI

struct CircleAlignment:AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        return context[VerticalAlignment.circleAlignment]
    }
    
    
}

extension VerticalAlignment {
  static let circleAlignment = VerticalAlignment(CircleAlignment.self)
}

struct AlignmentGuide: View {
    var body: some View {
        HStack(alignment: .circleAlignment) {
              ForEach(0..<5) { index in
                Circle()
                  .frame(width: 50, height: 50)
                  .alignmentGuide(.circleAlignment) { _ in CGFloat(index * 50) }
              }
            }
            .frame(height: 200)
            .border(Color.black, width: 1)
    }
}

#Preview {
    AlignmentGuide()
}
