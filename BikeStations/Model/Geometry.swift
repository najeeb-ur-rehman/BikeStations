//
//  Geometry.swift
//  BikeStations
//
//  Created by Najeeb on 05/07/2022.
//

import Foundation

enum GeometryType: String, Codable {
    case point = "Point"
}

struct Geometry: Codable {
    var coordinates: [Double]
    var type: GeometryType
}
