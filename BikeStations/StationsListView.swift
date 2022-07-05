//
//  StationsListView.swift
//  BikeStations
//
//  Created by Najeeb on 05/07/2022.
//

import SwiftUI

struct StationsListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { _ in
                    Section() {
                        ZStack {
                            StationInfoView()
                            NavigationLink(destination: StationInfoMapView()) {
                                EmptyView()
                            }.opacity(0)
                        }
                    }
                }
            }
            .navigationTitle("Bike Stations")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        .accentColor(.black)
    }
}


struct StationsListView_Previews: PreviewProvider {
    static var previews: some View {
        StationsListView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
