//
//  MapView.swift
//  Landmarks
//
//  Created by Arian Ahmadinejad on 2023-12-12.
//

import MapKit
import SwiftUI

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    var body: some View {
//        Map(initialPosition: .region(region), interactionModes: MapInteractionModes.zoom) {
//            Marker("Turtle Rock", coordinate: region.center)
//                .tint(.mint)
//            
//        }
        Map(position: .constant(.region(region)))
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
