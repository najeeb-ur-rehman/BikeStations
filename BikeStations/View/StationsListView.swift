//
//  StationsListView.swift
//  BikeStations
//
//  Created by Najeeb on 05/07/2022.
//

import SwiftUI

struct StationsListView: View {
    
    @StateObject var viewModel: StationListViewModel
    
    var body: some View {
        if viewModel.stations.isEmpty {
            Text(viewModel.message)
        } else {
            NavigationView {
                List(viewModel.stations, id: \.id) { station in
                    Section() {
                        ZStack {
                            StationInfoView(viewModel: StationInfoViewModel(station: station))
                            NavigationLink(destination: StationInfoMapView(viewModel: StationInfoMapViewModel(station: station))) {
                                EmptyView()
                            }.opacity(0)
                        }
                    }
                }
                .navigationTitle("Bike Stations")
                .navigationBarTitleDisplayMode(.inline)
            }
            .accentColor(.black)
        }
    }
}
