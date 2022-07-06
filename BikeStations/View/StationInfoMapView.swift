//
//  StationInfoMapView.swift
//  BikeStations
//
//  Created by Najeeb on 05/07/2022.
//

import SwiftUI
import MapKit

struct StationInfoMapView: View {
    
    @StateObject var viewModel: StationInfoMapViewModel
    
    var body: some View {
        VStack {
            Map(
                coordinateRegion: $viewModel.region,
                annotationItems: viewModel.places,
                annotationContent: { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 40, height: 40)
                                Image("Bike")
                            }
                            
                            Text(location.name)
                                .foregroundColor(.green)
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                        }
                    }
                }
            )
            StationInfoView(viewModel: viewModel.stationInfoViewModel)
                .padding()
        }
    }
}


extension CLLocationCoordinate2D {
    func distanceFromCoordinate(_ coordinate: CLLocationCoordinate2D) -> CLLocationDistance {
        let point1 = MKMapPoint(self)
        let point2 = MKMapPoint(coordinate)
        return point1.distance(to: point2)
    }
}
