//
//  StationInfoMapViewModel.swift
//  BikeStations
//
//  Created by Najeeb on 06/07/2022.
//

import Foundation
import MapKit
import SwiftUI

class StationInfoMapViewModel: ObservableObject {
    
    @Published var stationInfoViewModel: StationInfoViewModel
    
    @Published var region: MKCoordinateRegion
    
    @Published var places: [Place]
    
    init(station: Station) {
        self.stationInfoViewModel = StationInfoViewModel(station: station)
        self.region = MKCoordinateRegion(center: station.stationCoordinates,
                                         span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        self.places = [
            Place(name: station.properties.bikesAvailable, latitude: station.stationCoordinates.latitude, longitude: station.stationCoordinates.longitude)
        ]
    }
}
