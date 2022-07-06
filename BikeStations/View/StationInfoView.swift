//
//  StationInfoView.swift
//  BikeStations
//
//  Created by Najeeb on 05/07/2022.
//

import SwiftUI

struct StationInfoView: View {
    
    @StateObject var viewModel: StationInfoViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(viewModel.title)
                .font(.system(size: 26).bold())
                .padding([.leading, .trailing], 10)
            HStack {
                Text(viewModel.distance)
                    .font(.system(size: 14))
                Circle()
                    .fill(.gray)
                    .frame(width: 5, height: 5)
                Text(viewModel.type)
                    .foregroundColor(.black.opacity(0.6))
                    .font(.system(size: 14))
            }
            .padding([.leading, .trailing], 10)
            HStack {
                VStack(spacing: 5) {
                    Image("Bike")
                    Text(viewModel.availableBikesTitle)
                        .font(.system(size: 16))
                        .foregroundColor(.black.opacity(0.7))
                    Text(viewModel.availableBikes)
                        .foregroundColor(.green)
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                VStack(spacing: 5) {
                    Image("Lock")
                    Text(viewModel.availablePlacesTitle)
                        .font(.system(size: 16))
                        .foregroundColor(.black.opacity(0.7))
                    Text(viewModel.availablePlaces)
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
            }
            .padding([.top], 25)
        }
        .padding([.top, .bottom], 10)
    }
}
