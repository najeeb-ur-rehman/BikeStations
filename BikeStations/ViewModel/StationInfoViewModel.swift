//
//  StationInfoViewModel.swift
//  BikeStations
//
//  Created by Najeeb on 06/07/2022.
//

import Foundation
import CoreLocation

class StationInfoViewModel: ObservableObject {
    
    private let station: Station
    
    @Published var title: String
    @Published var type: String
    @Published var distance: String
    @Published var availableBikesTitle: String
    @Published var availableBikes: String
    @Published var availablePlacesTitle: String
    @Published var availablePlaces: String
    
    init(station: Station) {
        self.station = station
        
        title = "\(station.id) \(station.properties.name)"
        type = "Bike Station"
        distance = "\(Int(station.distanceValue))m"
        availableBikesTitle = "Available bikes"
        availableBikes = station.properties.bikesAvailable
        availablePlacesTitle = "Available places"
        availablePlaces = station.properties.placesAvailable
    }
}
