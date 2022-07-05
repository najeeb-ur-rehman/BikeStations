//
//  Station.swift
//  BikeStations
//
//  Created by Najeeb on 05/07/2022.
//

import Foundation

struct Station: Codable {
    var id: String
    var geometry: Geometry
    var properties: StationProperies
}


struct StationsResponse: Codable {
    var features: [Station]
}
