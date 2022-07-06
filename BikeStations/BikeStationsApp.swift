//
//  BikeStationsApp.swift
//  BikeStations
//
//  Created by Najeeb on 05/07/2022.
//

import SwiftUI

@main
struct BikeStationsApp: App {
    var body: some Scene {
        WindowGroup {
            StationsListView(viewModel: StationListViewModel())
        }
    }
}
