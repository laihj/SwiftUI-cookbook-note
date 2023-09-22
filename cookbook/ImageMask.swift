//
//  ImageMask.swift
//  cookbook
//
//  Created by laihj on 2023/9/19.
//

import SwiftUI

struct ImageMask: View {
    var body: some View {
        Image("original") // Load the image
          .resizable()
//          .scaledToFit()
          .scaledToFill()
          .frame(width: 400, height: 400) // Set the frame
          .clipShape(StarShape(points: 5, smoothness: 0.4))
          .shadow(radius: 20)
    }
}

struct StarShape: Shape {
  let points: Int
  let smoothness: CGFloat

  func path(in rect: CGRect) -> Path {
    assert(points >= 2, "A star must have at least 2 points")

    let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
    let outerRadius = min(rect.width, rect.height) / 2
    let innerRadius = outerRadius * smoothness

    let path = Path { path in
      let angleIncrement = .pi * 2 / CGFloat(points)
      let rotationOffset = CGFloat.pi / 2

      for point in 0..<points {
        let angle = angleIncrement * CGFloat(point) - rotationOffset
        let tippedAngle = angle + angleIncrement / 2

        let outerPoint = CGPoint(x: center.x + cos(angle) * outerRadius, y: center.y + sin(angle) * outerRadius)
        let innerPoint = CGPoint(x: center.x + cos(tippedAngle) * innerRadius, y: center.y + sin(tippedAngle) * innerRadius)

        if point == 0 {
          path.move(to: outerPoint)
        } else {
          path.addLine(to: outerPoint)
        }

        path.addLine(to: innerPoint)
      }

      path.closeSubpath()
    }
    return path
  }
}

#Preview {
    ImageMask()
}
