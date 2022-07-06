//
//  Station.swift
//  BikeStations
//
//  Created by Najeeb on 05/07/2022.
//

import Foundation
import CoreLocation

struct Station: Codable {
    var id: String
    var geometry: Geometry
    var properties: StationProperties
    var distance: Double?
    
    var distanceValue: Double {
        distance ?? 0.0
    }
}

extension Station {
    
    var stationCoordinates: CLLocationCoordinate2D {
        let lat = geometry.coordinates.count > 0 ? geometry.coordinates[0] : 0.0
        let long = geometry.coordinates.count > 1 ? geometry.coordinates[1] : 0.0
        return CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    static var stations: [Station] = {
        let geo = Geometry(coordinates: [16.5539, 54.7353], type: .point)
        let geo2 = Geometry(coordinates: [1.4229, 1.353], type: .point)
        let geo3 = Geometry(coordinates: [16.2111, 54.1453], type: .point)
        
        let prop1 = StationProperties(name: "Station1", bikesAvailable: "2", placesAvailable: "5")
        let station1 = Station(id: "1", geometry: geo, properties: prop1)
        
        let prop2 = StationProperties(name: "Station2", bikesAvailable: "12", placesAvailable: "14")
        let station2 = Station(id: "2", geometry: geo2, properties: prop2)
        
        let prop3 = StationProperties(name: "Station3", bikesAvailable: "10", placesAvailable: "4")
        let station3 = Station(id: "3", geometry: geo3, properties: prop3)
        
        let prop4 = StationProperties(name: "Station4", bikesAvailable: "2", placesAvailable: "24")
        let station4 = Station(id: "4", geometry: geo, properties: prop4)
        
        return [station1, station2, station3, station4]
    }()
    
}


struct StationsResponse: Codable {
    var features: [Station]
}



