//
//  mapmap.swift
//  cookbook
//
//  Created by laihj on 2024/3/13.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let newYork: Self = .init(
        latitude: 40.730610,
        longitude: -73.935242
    )
    
    static let seattle: Self = .init(
        latitude: 47.608013,
        longitude: -122.335167
    )
    
    static let sanFrancisco: Self = .init(
        latitude: 37.733795,
        longitude: -122.446747
    )
}

struct mapmap: View {
    @State private var position: MapCameraPosition = .camera(
            .init(centerCoordinate: .newYork, distance: 10_000_0)
        )
    
    let rect = MKMapRect(
        origin: MKMapPoint(.newYork),
        size: MKMapSize(width: 2, height: 2)
    )
    
    @Namespace private var favoritesMap
        
        var body: some View {
            
            Map(bounds: MapCameraBounds(centerCoordinateBounds: rect)) {
                        Marker("New York", monogram: Text("NY"), coordinate: .newYork)
                    }
            
//            Map(position: $position,scope: favoritesMap) {
//                Marker("New York", monogram: Text("NY"), coordinate: .newYork)
//                
//                Marker("San Francisco", monogram: Text("SF"), coordinate: .sanFrancisco)
//                
//                Annotation("Seattle", coordinate: .seattle) {
//                    HStack {
//                        Text("Se")
//                        Image(systemName: "mappin")
//                            .foregroundStyle(.black)
//                            .padding()
//                            .background(.red)
//                            .clipShape(Circle())
//                    }
//                    }
//                                
//            }
//            .mapControls {
//                        MapScaleView()
//                        MapCompass()
//                MapUserLocationButton()
//                    }
//            .mapStyle(.standard(
//                pointsOfInterest: .excludingAll,
//                showsTraffic: false)
//            )
//            HStack {
//                            MapScaleView(scope: favoritesMap)
//                            MapCompass(scope: favoritesMap)
//                        }
        }
}

#Preview {
    mapmap()
}
