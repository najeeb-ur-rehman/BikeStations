//
//  StationRepository.swift
//  BikeStations
//
//  Created by Najeeb on 06/07/2022.
//

import Foundation
import Combine


class StationsRepository {
    
    private var apiClient: APIClient
    
    init(client: APIClient) {
        self.apiClient = client
    }

    func getBikeStations() -> AnyPublisher<StationsResponse, Error> {
        let request = StationRequest.bikeStations
        return apiClient.dispatch(request)
    }
}
