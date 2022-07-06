//
//  StationListViewModel.swift
//  BikeStations
//
//  Created by Najeeb on 06/07/2022.
//

import Foundation
import CoreLocation
import Combine

class StationListViewModel: ObservableObject {
    
    @Published var stations = [Station]()
    @Published var message = "Loading..."
    
    private var cancellables = Set<AnyCancellable>()
    
    private var currentLocation: CLLocationCoordinate2D
    
    init(repository: StationsRepository,
         currentLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 16.00, longitude: 54.00)) {
        self.currentLocation = currentLocation
        
        repository.getBikeStations().sink { [weak self] result in
            switch result {
            case .failure:
                self?.message = "Seomthing went wrong. Failed to get stations"
            case .finished:
                self?.message = "No stations found near you"
            }
        } receiveValue: { [weak self] response in
            self?.handleStationsList(response.features)
        }.store(in: &cancellables)
        

    }
    
    private func handleStationsList(_ stations: [Station]) {
        self.stations = stations.map{
            var station = $0
            station.distance = $0.stationCoordinates.distanceFromCoordinate(currentLocation)
            return station
        }.sorted {
            return $0.stationCoordinates.distanceFromCoordinate(currentLocation) < $1.stationCoordinates.distanceFromCoordinate(currentLocation)
        }
    }
}
