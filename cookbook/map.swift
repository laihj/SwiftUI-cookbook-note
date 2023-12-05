//
//  map.swift
//  cookbook
//
//  Created by laihj on 2023/10/16.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let working = CLLocationCoordinate2D(latitude:23.11 , longitude: 113.31)
    static let parking = CLLocationCoordinate2D(latitude:23.51 , longitude: 113.81)
}

struct MapDemoView: View {

  var body: some View {
      Map() {
          Marker(coordinate: .working) {
              Text("work")
          }
          Annotation("", coordinate: .parking) {
              Text("not good")
          }
          MapPolyline(points: [MKMapPoint(.parking), MKMapPoint(.working)], contourStyle: .geodesic)
              .stroke(.blue,lineWidth: 5)
              .foregroundStyle(.yellow)

      }.mapStyle(.standard(elevation: .realistic))
      Text("hello")
          .task {
              do {
                  // Simulate an asynchronous task
                  try? await Task.sleep(nanoseconds: 2_000_000_000) // Sleep for 2 seconds
                  print("Data loaded")
              } catch {
                  print("Error: \(error)")
              }
          }
  }
}


#Preview {
    MapDemoView()
}
