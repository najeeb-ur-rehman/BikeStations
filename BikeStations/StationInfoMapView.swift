//
//  StationInfoMapView.swift
//  BikeStations
//
//  Created by Najeeb on 05/07/2022.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
let id = UUID()
let name: String
let latitude: Double
let longitude: Double
var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}

struct StationInfoMapView: View {
    
    let places = [
        Place(name: "Position 1", latitude: 31.58, longitude: 74.32),
    ]
    
    @State private var region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: 31.58,
                        longitude: 74.32),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.05,
                        longitudeDelta: 0.05)
                    )
    
    var body: some View {
        VStack {
            Map(
               coordinateRegion: $region,
               annotationItems: places,
               annotationContent: { location in
                   MapAnnotation(coordinate: location.coordinate) {
                       Image(systemName: "pin.circle.fill").foregroundColor(.red)
                       Text("7")
                   }
               }
            )
            StationInfoView()
        }
    }
}
