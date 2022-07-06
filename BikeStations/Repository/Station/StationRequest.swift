//
//  StationRequest.swift
//  BikeStations
//
//  Created by Najeeb on 06/07/2022.
//

import Foundation


enum StationRequest: HTTPRequest {
    case bikeStations
}

extension StationRequest {
    var path: String {
        switch self {
        case .bikeStations: return "mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe"
        }
    }
}
