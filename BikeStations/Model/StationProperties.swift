//
//  StationProperties.swift
//  BikeStations
//
//  Created by Najeeb on 05/07/2022.
//

import Foundation


struct StationProperies: Codable {
    var name: String
    var bikesAvailable: String
    var placesAvailable: String
    
    enum CodingKeys: String, CodingKey {
        case name = "label"
        case bikesAvailable = "bikes"
        case placesAvailable = "bike_racks"
    }
    
}
