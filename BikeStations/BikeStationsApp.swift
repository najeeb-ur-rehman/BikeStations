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
            let client = APIClient(baseUrl: "https://www.poznan.pl/")
            let repo = StationsRepository(client: client)
            StationsListView(viewModel: StationListViewModel(repository: repo))
        }
    }
}
