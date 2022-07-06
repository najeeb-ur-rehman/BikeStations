//
//  Place.swift
//  BikeStations
//
//  Created by Najeeb on 06/07/2022.
//

import Foundation
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
