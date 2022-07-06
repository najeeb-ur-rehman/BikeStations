//
//  StationListViewModel.swift
//  BikeStations
//
//  Created by Najeeb on 06/07/2022.
//

import Foundation
import CoreLocation

class StationListViewModel: ObservableObject {
    
    @Published var stations = [Station]()
    
    private var currentLocation: CLLocationCoordinate2D
    
    init(currentLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 16.00, longitude: 54.00)) {
        self.currentLocation = currentLocation
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.stations = Station.stations.map{
                var station = $0
                station.distance = $0.stationCoordinates.distanceFromCoordinate(currentLocation)
                return station
            }.sorted {
                return $0.stationCoordinates.distanceFromCoordinate(currentLocation) < $1.stationCoordinates.distanceFromCoordinate(currentLocation)
            }
        }
    }
}
